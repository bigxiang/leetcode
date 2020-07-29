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
  #
  # 4. Dim Reduction
  #   Since the current value only depends on values of i-1, i-2,
  #   we can just use 2 values to calculate the result repeatedly.
  #   prev_max = dp[i-2]
  #   curr_max = dp[i-1]
  #   after calculating, set prev_max = curr_max, curr_max = calculated

  [rob_houses(nums[0..-2]), rob_houses(nums[1..-1])].max
end

def rob_houses(nums)
  prev_max = 0
  curr_max = 0

  (0..nums.size-1).each do | i|
    prev_max, curr_max = curr_max, [curr_max, prev_max + nums[i]].max
  end

  curr_max
end
# @lc code=end

puts rob([2,3,2])
puts rob([1,2,3,1])
