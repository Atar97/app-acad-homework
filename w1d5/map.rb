class Map

  def initialize
    @m = [[]]
  end

  def set(key, value)
    key_index = @m.key?(key)
    key_index ? @m[key_index] = [key, value] : @m << [key, value]
  end

  def get(key)
    key_index = @m.key?(key)
    key_index ? @m[key_index].last : nil
  end

  def delete(key)
    key_index = @m.key?(key)
    key_index ? @m.delete_at(key_index) : nil
  end

  def show
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
