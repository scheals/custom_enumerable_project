module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
    self
  end

  def my_select
    selected = []
    for element in self
      selected << element if yield(element)
    end
    selected
  end

  def my_all?
    selected = []
    for element in self
      selected << element if yield(element)
    end
    self == selected
  end

  def my_any?
    found_any = nil
    for element in self
      break found_any = true if yield(element)

      found_any = false
    end
    found_any
  end

  def my_none?
    found_none = nil
    for element in self
      break found_none = false if yield(element)

      found_none = true
    end
    found_none
  end

  def my_count
    return self.size unless block_given?

    count = 0
    for element in self
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    transformed = []
    for element in self
      transformed << yield(element)
    end
    transformed
  end

  def my_inject(starter = nil)
    reducer = starter
    for element in self
      reducer = yield(reducer, element)
    end
    reducer
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end
