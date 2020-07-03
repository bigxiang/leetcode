#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  tmp = nums.select { |n| !n.zero? }
  return if nums.size == tmp.size

  (0..nums.size-1).each do |i|
    if i < tmp.size
      nums[i] = tmp[i]
    else
      nums[i] = 0
    end
  end
end
# @lc code=end

