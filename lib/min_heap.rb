class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: o(log n)
  # Space Complexity: o(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.length-1)
    return
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: o(log n)
  # Space Complexity: o(1)
  def remove()
    swap(0, @store.length-1)
    result = @store.pop
    heap_down(0) unless @store.empty?
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: o(1)
  # Space complexity: o(1)
  def empty?
    return @store.length == 0 ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: o(log n)
  # Space complexity: o(1)
  def heap_up(index)
    # base cases
    return if index == 0
    return if @store[(index-1)/2].key < @store[index].key

    # if the parent is bigger then itself
    if @store[(index-1)/2].key > @store[index].key
      swap((index-1)/2, index)
      heap_up((index-1)/2)
    end
    return 
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_i = 2*index+1
    right_i = 2*index+2
    # base case
    # if there is no more children
    return if left_i > @store.length-1 

    # find the min_child
    min_i = left_i
    if right_i < @store.length
      min_i = (@store[left_i].key < @store[right_i].key ? left_i : right_i)
    end
    return if @store[index].key < @store[min_i].key

    swap(min_i, index)
    heap_down(min_i)
    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end