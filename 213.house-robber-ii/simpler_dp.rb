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
  return nums[0] if nums.size == 1

  # 1. Define subproblem
  #   If we are going to rob the first house, we won't be able to rob the last house.
  #   the problem can be the max value of
  #     rob house [0..nums.size-2]
  #     rob house [1..nums.size-1]
  #   Then we can use two arrays to save states
  #
  # 2. Define states
  #   dp[i] = current max money that has robbed
  #   i = house index
  #
  # 3. DP Formula
  #   dp[i] = [dp[i-1], dp[i-2] + n].max

  [rob_houses(nums[0..-2]), rob_houses(nums[1..-1])].max
end

def rob_houses(nums)
  dp = Array.new(nums.size + 2, 0)

  (0..nums.size-1).each do | i|
    dp[i+2] = [dp[i+1], dp[i] + nums[i]].max
  end

  dp[-1]
end
# @lc code=end

puts rob([2,3,2])
puts rob([1,2,3,1])
