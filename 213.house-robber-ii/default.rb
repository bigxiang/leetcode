#
# @lc app=leetcode id=213 lang=ruby
#
# [213] House Robber II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?

  # 1. Define subproblem
  #   p(i) =
  #     if i-1 is robbed
  #       p(i-1)
  #     else
  #       p(i-1) + nums[i]
  #     end
  #
  #   but if i == nums.size - 1, we have to consider if the first house is robbed
  # 2. Define states
  #   dp[i][j] = current money that has robbed
  #   i = house index
  #   j = 0 or 1, 0 means the house is not robbed, 1 means the house is robbed
  #   k = 0 or 1, 0 means the first house is not robbed, 1 means the first house is robbed
  #
  # 3. DP Formula
  #   dp[i][0][0] = [dp[i-1][1][0], dp[i-1][0][0]].max
  #   dp[i][1][0] = dp[i-1][0][0] + nums[i]
  #   dp[i][0][1] = [dp[i-1][0][1], dp[i-1][1][1]].max
  #   dp[i][1][1] =
  #     if i != nums.size - 1
  #       dp[i-1][0][1].max + nums[i]
  #     else
  #       0
  #     end

  dp = Array.new(nums.size) { Array.new(2) { Array.new(2, 0) } }

  nums.each_with_index do |n, i|
    if i == 0
      dp[0][0][0] = 0
      dp[0][0][1] = 0
      dp[0][1][1] = n
      dp[0][1][0] = 0
    else
      dp[i][0][0] = [dp[i-1][1][0], dp[i-1][0][0]].max
      dp[i][1][0] = dp[i-1][0][0] + n
      dp[i][0][1] = [dp[i-1][0][1], dp[i-1][1][1]].max
      dp[i][1][1] = i == nums.size - 1 ? 0 : dp[i-1][0][1] + n
    end
  end

  dp[-1].flatten.max
end
# @lc code=end

puts rob([2,3,2])
puts rob([1,2,3,1])
