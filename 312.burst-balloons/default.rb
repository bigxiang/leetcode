#
# @lc app=leetcode id=312 lang=ruby
#
# [312] Burst Balloons
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
  return 0 if nums.empty?

  nums.unshift(1) && nums.push(1)

  dp = Array.new(nums.size) { Array.new(nums.size, 0) }
  (3..nums.size).each do |window_size|
    (0..nums.size-window_size).each do |window_start_index|
      window_end_index = window_start_index + window_size - 1
      max_coins = 0
      (window_start_index+1..window_end_index-1).each do |last_burst_index|
         max_coins = [
           max_coins,
           dp[window_start_index][last_burst_index] +
             dp[last_burst_index][window_end_index] +
             nums[window_start_index] * nums[last_burst_index] * nums[window_end_index]
        ].max
      end
      dp[window_start_index][window_end_index] = max_coins
    end
  end
  dp[0][-1]
end
# @lc code=end

