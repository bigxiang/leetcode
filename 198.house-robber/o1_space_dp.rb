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
  #
  # 4. Dim Reduction
  #   Since the current value only depends on values of i-1, i-2,
  #   we can just use 2 values to calculate the result repeatedly.
  #   prev_max = dp[i-2]
  #   curr_max = dp[i-1]
  #   after calculating, set prev_max = curr_max, curr_max = calculated

  prev_max = 0
  curr_max = 0

  (0..nums.size-1).each do | i|
    prev_max, curr_max = curr_max, [curr_max, prev_max + nums[i]].max
  end

  curr_max
end
# @lc code=end

