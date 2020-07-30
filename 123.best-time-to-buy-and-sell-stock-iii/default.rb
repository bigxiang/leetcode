require 'pp'
#
# @lc app=leetcode id=123 lang=ruby
#
# [123] Best Time to Buy and Sell Stock III
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  dp = Array.new(prices.size) { Array.new(2) { Array.new(3, -Float::INFINITY) } }

  prices.each_with_index do |p, i|
    if i == 0
      dp[0][0][0] = 0
      dp[0][1][0] = -p
      next
    end

    (0..2).each do |k|
      dp[i][0][k] = [dp[i-1][0][k], k == 0 ? 0 : dp[i-1][1][k-1] + p].max
      dp[i][1][k] = [dp[i-1][1][k], dp[i-1][0][k] - p].max
    end
  end

  dp[-1][0].max
end
# @lc code=end

# dp[i][j][k] i = day, j = hold, k = transaction count

# dp[i][0][k] = [dp[i-1][0][k], dp[i-1][1][k-1] + p].max
# dp[i][1][k] = [dp[i-1][1][k], dp[i-1][0][k-1] - p].max

puts max_profit([3,3,5,0,0,3,1,4])
puts max_profit([1,2,3,4,5])
puts max_profit([7,6,4,3,1])
