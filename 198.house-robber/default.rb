#
# @lc app=leetcode id=198 lang=ruby
#
# [198] House Robber
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?
  return nums[0] if nums.size == 1

  # 1. Define subproblem
  #   p(i) =
  #     if i is not supposed to be robbed
  #       p(i-1)
  #     else
  #       p(i-2) + nums[i]
  #     end
  #
  # 2. Define states
  #   dp[i] = current max money that has robbed
  #   i = house index
  #
  # 3. DP Formula
  #   dp[i] = [dp[i-1], dp[i-2] + n].max

  dp = Array.new(nums.size + 2, 0)

  (0..nums.size-1).each do | i|
    dp[i+2] = [dp[i+1], dp[i] + nums[i]].max
  end

  dp[-1]
end
# @lc code=end

