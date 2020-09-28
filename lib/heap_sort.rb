require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new
  list.each do |number|
    # apply the .add instance method 
    heap.add(number)
  end

  list.each_with_index do |number, index|
    list[index] = heap.remove()
  end 
  return list
end