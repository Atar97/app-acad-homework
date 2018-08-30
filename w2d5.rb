class LRUCache

  def initialize(size)
    @c = []
  end

  def count
    # returns number of elements currently in cache
    @c.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @c.include?(el)
      @c.delete(el)
      @c << el
    else 
      if count > 3
        @c.shift
        @c << el
      else
        @c << el
      end
    end
  end

  def show
    @c
  end

  private
  # helper methods go here!

end

johnny_cache = LRUCache.new(4)

  print "#{johnny_cache.add("I walk the line")} \n"
  print "#{johnny_cache.add(5)} \n"

  print "#{johnny_cache.count} \n" # => returns 2}

  print "#{johnny_cache.add([1,2,3])} \n"
  print "#{johnny_cache.add(5)} \n"
  print "#{johnny_cache.add(-5)} \n"
  print "#{johnny_cache.add({a: 1, b: 2, c: 3})} \n"
  print "#{johnny_cache.add([1,2,3,4])} \n"
  print "#{johnny_cache.add("I walk the line")} \n"
  print "#{johnny_cache.add(:ring_of_fire)} \n"
  print "#{johnny_cache.add("I walk the line")} \n"
  print "#{johnny_cache.add({a: 1, b: 2, c: 3})} \n"


print "#{johnny_cache.show}\n" # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]}
