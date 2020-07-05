#
# @lc app=leetcode id=347 lang=ruby
#
# [347] Top K Frequent Elements
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  nums_count = nums.each_with_object(Hash.new(0)) do |n, memo|
    memo[n] += 1
  end

  heap = BinaryMinCountHeap.new(nums_count)

  nums.each do |n|
    heap.push(n)
    heap.pop if heap.elements.size > k
  end

  heap.elements
end

class BinaryMinCountHeap
  attr_reader :elements, :elements_set, :nums_count

  def initialize(nums_count)
    @elements = []
    @elements_set = {}
    @nums_count = nums_count
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

    if nums_count[elements[i]] < nums_count[elements[parent_i]]
      elements[i], elements[parent_i] = elements[parent_i], elements[i]
      heapify_up(parent_i)
    end
  end

  def heapify_down(i)
    left_child_i = left_child_index(i)
    right_child_i = right_child_index(i)

    return if left_child_i > elements.size - 1

    min_child_i =
      if right_child_i <= elements.size - 1 && nums_count[elements[left_child_i]] > nums_count[elements[right_child_i]]
        right_child_i
      else
        left_child_i
      end

    return if nums_count[elements[i]] < nums_count[elements[min_child_i]]

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

