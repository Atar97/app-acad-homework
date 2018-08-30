class Octopus

  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  SORTER = Proc.new {|el1, el2| el1.length <= el2.length}
  TENTICLES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  thing = {}
  TENTICLES.each_with_index {|el, i| thing[el] = i}
  BETTER = thing
  def polynomial(&prc)
    steps = 0
    sorted = false
    array = FISH.dup
    until sorted
      sorted = true
      i = 0
      while i < array.length - 1
        unless SORTER.call(array[i], array[i+1])
          array[i], array[i+1] = array[i+1], array[i]
          sorted = false
        end
        i += 1
      end
      steps+= i
    end
    [steps, array.last]
  end

  def nlogn(array, &prc)
    array = array.dup
    return array if array.count <= 1
    left = array.take(array.count / 2)
    right = array.drop(array.count / 2)
    Octopus.merge(nlogn(left, &prc), nlogn(right, &prc), &prc)
  end


  def n(&prc)
    biggest = ""
    FISH.each do |fish|
      biggest = fish if SORTER.call(biggest, fish)
    end
    biggest
  end

  def slow_dance(direction)
    TENTICLES.each_with_index do |el, i|
      return i if el == direction
    end
    nil
  end

  def fast_dance(direction)
    BETTER[direction]
  end

  private

  def self.merge(left, right, &prc)
    ret = []
    until left.empty? || right.empty?
      if SORTER.call(left.first, right.first)
        ret << left.shift
      else
        ret << right.shift
      end
    end
    ret + left + right
  end

end

larry = Octopus.new
puts larry.n(&Octopus::SORTER)
puts larry.polynomial(&Octopus::SORTER)
puts larry.nlogn(Octopus::FISH, &Octopus::SORTER).last
puts larry.slow_dance("right-down")
puts larry.fast_dance("right-down")
