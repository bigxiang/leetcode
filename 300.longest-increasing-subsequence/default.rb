#
# @lc app=leetcode id=300 lang=ruby
#
# [300] Longest Increasing Subsequence
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  return 0 if nums.empty?

  dp = Array.new(nums.size)
  dp[0] = 1
  result = 1
  (1..nums.size - 1).each do |i|
    max_length = 1
    (0...i).each do |j|
      max_length = [max_length, dp[j] + 1].max if nums[i] > nums[j]
    end
    dp[i] = max_length
    result = [dp[i], result].max
  end
  result
end
# @lc code=end
