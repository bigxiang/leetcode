#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  (nums.size-1).times do |i|
    (0..nums.size-i-1).each do |j|
      next if !nums[j].zero? || j == nums.size-1
      next if nums[j] == nums[j+1]

      nums[j], nums[j+1] = nums[j+1], nums[j]
    end

    break if nums[-(i+1)] != 0
  end
end
# @lc code=end

