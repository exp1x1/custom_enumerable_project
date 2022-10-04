module Enumerable
  # Your code goes here
  def my_each
    for el in self
      yield el
    end
  end

  def my_each_with_index
    i = 0
    for el in self
      yield el, i
      i += 1
    end
  end

  def my_select
    result = []
    for el in self
      result << el if yield(el)
    end
    result
  end

  def my_all?
    for el in self
      return false unless yield el
    end
    true
  end

  def my_any?
    for el in self
      return true if yield el
    end
    false
  end

  def my_none?
    for el in self
      return false  if yield el
    end
    true
  end

  def my_count
    return self.length unless block_given?
    i = 0 
    for el in self
      i += 1 if yield el
    end
    i
  end

  def my_map
    result = Array.new
    for el in self
      result << yield(el)
    end
    result
  end

  def my_inject(int_op)

    for el in self
      int_op = yield(int_op, el) 
    end
    int_op
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  include Enumerable
end
