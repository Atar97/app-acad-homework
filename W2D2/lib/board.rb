require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    @cups.map!.with_index do |cup, idx|
      if idx % 7 == 6
        []
      else
        [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    opp_cup = current_player_name == 'Erica' ? 13 : 6
    cup = @cups[start_pos]
    until cup.empty?
      # byebug
      start_pos += 1
      if start_pos > 13
        start_pos = 0
      end
      @cups[start_pos] << cup.pop unless start_pos == opp_cup
    end
    render
    # byebug
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # byebug
    if @cups[ending_cup_idx].count == 1
      return :switch
    elsif ending_cup_idx % 7 != 6
      ending_cup_idx
    else
      :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? {|cup| cup.empty?} || @cups[7...13].all? {|cup| cup.empty?}
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 0
      :draw
    when -1
      "James"
    when 1
      "Erica"
    end
  end

end

class Cup
  attr_accessor :stones

  def initialize(stones = 0)
    @store = false
    @stones = []
    stones.times {@stones << :stone}
  end

  def empty?
    @stones.empty?
  end

  def add_stones(num)
    num.times {@stones << :stone}
  end

end
