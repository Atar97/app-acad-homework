class Map

  def initialize
    @m = []
  end

  def set(key, value)
    key_index = key?(key)
    key_index ? @m[key_index] = [key, value] : @m << [key, value]
  end

  def get(key)
    key_index = key?(key)
    key_index ? @m[key_index].last : nil
  end

  def delete(key)
    key_index = key?(key)
    key_index ? @m.delete_at(key_index) : nil
  end

  def show
    @m
  end

  def to_s
    @m.inject("* ") do |acc, key_value_pair|
      acc + " #{key_value_pair} *"
    end
  end

  private

  def key?(target)
    @m.each_with_index do |key_value_pair, index|
      return index if key_value_pair[0] == target
    end
    false
  end
end

map = Map.new
map.set("apple", "a delicious fruit")
map.set("peach", "a juicy delicious fruit")
puts map.show
puts map
map.set("apple", "a gross fruit")
map.delete("peach")
puts map
