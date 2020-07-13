#
# @lc app=leetcode id=215 lang=ruby
#
# [215] Kth Largest Element in an Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  # Turn kth largest to n-k smallest, n-k is the index of nums.
  quick_select(nums, 0, nums.size-1, nums.size-k)
end

def quick_select(nums, left_index, right_index, k_smallest)
  return nums[left_index] if left_index == right_index

  # random select a pivot
  pivot_index = rand(left_index..right_index)
  # move nums smaller than pivot to left, larger than pivot to right
  pivot_index = partition(nums, left_index, right_index, pivot_index)
  # if pivot index is n-k, then it is the number
  if pivot_index == k_smallest
    return nums[pivot_index]
  # else we continue looking for the correct index in left part
  elsif pivot_index > k_smallest
    quick_select(nums, left_index, pivot_index-1, k_smallest)
  # or right part.
  else
    quick_select(nums, pivot_index+1, right_index, k_smallest)
  end
end

def partition(nums, left_index, right_index, pivot_index)
  nums[right_index], nums[pivot_index] = nums[pivot_index], nums[right_index]
  smaller_index = left_index
  (left_index...right_index).each do |i|
    if nums[i] < nums[right_index]
      nums[smaller_index], nums[i] = nums[i], nums[smaller_index]
      smaller_index += 1
    end
  end
  nums[right_index], nums[smaller_index] = nums[smaller_index], nums[right_index]
  smaller_index
end
# @lc code=end

