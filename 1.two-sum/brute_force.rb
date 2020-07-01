#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  (0..nums.size-2).each do |i|
    (1..nums.size-1).each do |j|
      next if i == j

      return [i, j] if nums[i] + nums[j] == target
    end
  end
end
# @lc code=end

