#
# @lc app=leetcode id=31 lang=ruby
#
# [31] Next Permutation
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  return nums if nums.size == 1

  start = 0
  (nums.size-1).downto(1).each do |i|
    if nums[i] > nums[i-1]
      start = i-1
      break
    end
  end

  rearrange(nums, start)
end

def rearrange(nums, start)
  switch_position = nil

  (start+1..nums.size-1).each do |i|
    break if nums[start] >= nums[i]
    switch_position = i
  end

  if switch_position.nil?
    reverse_nums(nums, 0)
  else
    nums[start], nums[switch_position] = nums[switch_position], nums[start]
    reverse_nums(nums, start+1)
  end

end

def reverse_nums(nums, start)
  lo = start
  hi = nums.size - 1
  while lo < hi
    nums[lo], nums[hi] = nums[hi], nums[lo]
    lo += 1
    hi -= 1
  end
end
# @lc code=end

