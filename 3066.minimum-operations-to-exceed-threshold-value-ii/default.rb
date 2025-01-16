#
# @lc app=leetcode.cn id=3066 lang=ruby
# @lcpr version=30204
#
# [3066] 超过阈值的最少操作数 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
  min_heap = Heap.new(->(a, b) { a > b })

  nums.each do |n|
    min_heap.push(n)
  end

  count = 0
  while min_heap.top < k
    x = min_heap.pop
    y = min_heap.pop
    min_heap.push([x, y].min * 2 + [x, y].max)
    count += 1
  end

  count
end

class Heap
  attr_reader :data, :com_proc

  def initialize(com_proc)
    @data = [0]
    @com_proc = com_proc
  end

  def top
    data[1]
  end

  def push(val)
    data.push(val)
    heapify_up(data.size - 1)
  end

  def pop
    return nil if data.size == 1
    return data.pop if data.size == 2

    data[1], data[data.size - 1] = data[data.size - 1], data[1]
    popped = data.pop
    heapify_down(1)
    popped
  end

  private

  def heapify_up(index)
    return if index == 1

    parent_index = index / 2
    return unless com_proc.call(data[parent_index], data[index])

    data[parent_index], data[index] = data[index], data[parent_index]
    heapify_up(parent_index)
  end

  def heapify_down(index)
    return if index == data.size - 1

    left_child_index = index * 2
    right_child_index = index * 2 + 1
    target_index = index

    if left_child_index < data.size && com_proc.call(data[index], data[left_child_index])
      target_index = left_child_index
    end

    if right_child_index < data.size && com_proc.call(data[target_index], data[right_child_index])
      target_index = right_child_index
    end

    return if target_index == index

    data[target_index], data[index] = data[index], data[target_index]
    heapify_down(target_index)
  end
end
# @lc code=end

#
# @lcpr case=start
# [2,11,10,1,3]\n10\n
# @lcpr case=end

# @lcpr case=start
# [1,1,2,4,9]\n20\n
# @lcpr case=end

# @lcpr case=start
# [1,1]\n2\n
# @lcpr case=end

#
