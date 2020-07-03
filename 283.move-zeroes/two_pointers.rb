#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  non_zero_index = 0

  nums.each_with_index do |n, i|
    next if n.zero?

    nums[non_zero_index] = n
    non_zero_index += 1
  end

  (non_zero_index..nums.size-1).each do |i|
    nums[i] = 0
  end
end
# @lc code=end

