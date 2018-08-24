class Map

  def initialize
    @m = [[]]
  end

  def set(key, value)
    key_index = @m.key?(key)
    key_index ? @m[key_index] = [key, value] : @m << [key, value]
  end

  def get(key)

  end

  def delete(key)

  end

  def show

  end

  private

  def key?(target)
    @m.each_with_index do |key_value_pair, index|
      return index if key_value_pair[0] == target
    end
    false
  end

end
