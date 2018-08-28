class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Cup.new}
    place_stones
  end

  def place_stones
    @cups.map!.with_index do |cup, idx|
      if idx % 7 == 6
        
      else
        cup.add_stones(4)
      end
    end
  end

  def valid_move?(start_pos)
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
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
