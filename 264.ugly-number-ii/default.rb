#
# @lc app=leetcode id=264 lang=ruby
#
# [264] Ugly Number II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  heap = NoDupBinaryMinHeap.new
  return 1 if n == 1

  result = [1]
  (1..n-1).each do |i|
    [2,3,5].each { |p| heap.push(p * result[i - 1]) }
    result << heap.pop
  end

  result.last
end

class NoDupBinaryMinHeap
  attr_reader :elements, :elements_set

  def initialize
    @elements = []
    @elements_set = {}
  end

  def push(val)
    return if elements_set[val]

    elements << val
    elements_set[val] = true
    heapify_up(elements.size - 1)
  end

  def pop
    return nil if elements.empty?

    result = elements[0]
    elements[0] = elements.pop
    elements_set[result] = false
    heapify_down(0)
    result
  end

  private

  def heapify_up(i)
    parent_i = parent_index(i)
    return if parent_i < 0

    if elements[i] < elements[parent_i]
      elements[i], elements[parent_i] = elements[parent_i], elements[i]
      heapify_up(parent_i)
    end
  end

  def heapify_down(i)
    left_child_i = left_child_index(i)
    right_child_i = right_child_index(i)

    return if left_child_i > elements.size - 1

    min_child_i =
      if right_child_i <= elements.size - 1 && elements[left_child_i] > elements[right_child_i]
        right_child_i
      else
        left_child_i
      end

    return if elements[i] < elements[min_child_i]

    elements[i], elements[min_child_i] = elements[min_child_i], elements[i]
    heapify_down(min_child_i)
  end

  def left_child_index(i)
    2 * i + 1
  end

  def right_child_index(i)
    2 * i + 2
  end

  def parent_index(i)
    (i - 1) / 2
  end
end
# @lc code=end

