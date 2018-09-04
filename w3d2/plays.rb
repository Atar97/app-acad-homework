require 'sqlite3'
require 'singleton'
require 'byebug'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id
  CON = PlayDBConnection.instance
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(play_title)
    data = CON.execute(<<-SQL, play_title)
      SELECT *
      FROM plays
      WHERE plays.title = ?;
    SQL
    byebug
    data.map {|datum| Play.new(datum)}
  end

  def self.find_by_playwright(name)
    data = CON.execute(<<-SQL, name)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id IN (
          SELECT id
          FROM playwrights
          WHERE name = ?
      )
    SQL
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class PlayWright
  attr_accessor :name, :birth_year

  CON = PlayDBConnection.instance

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.all
    data = CON.execute(<<-SQL)
      SELECT
        *
      FROM
        playwrights
    SQL
    data.map {|datum| PlayWright.new(datum)}
  end

  def self.find_by_name(name)
    data = CON.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    data.map {|datum| PlayWright.new(datum)}
  end

  def create
    raise "#{self} already in database" if @id
    CON.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights(name, birth_year)
      VALUES
       (?, ?)
    SQL
    @id = CON.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    CON.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
    self
  end

  def get_plays
    data = CON.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    data.map { |datum|  Play.new(datum) }
  end

end
