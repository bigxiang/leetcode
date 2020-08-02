#
# @lc app=leetcode id=309 lang=ruby
#
# [309] Best Time to Buy and Sell Stock with Cooldown
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
FREE_TO_BUY = 0
STOCK_ON_HAND = 1
IN_COOLDOWN = 2

def max_profit(prices)
  return 0 if prices.empty?

  dp = Array.new(prices.size) { Array.new(3, -Float::INFINITY) }

  prices.each_with_index do |price, day|
    if day == 0
      dp[day][FREE_TO_BUY] = 0
      dp[day][STOCK_ON_HAND] = -price
      next
    end

    dp[day][FREE_TO_BUY] = [dp[day-1][FREE_TO_BUY], dp[day-1][IN_COOLDOWN]].max
    dp[day][STOCK_ON_HAND] = [dp[day-1][STOCK_ON_HAND], dp[day-1][FREE_TO_BUY] - price].max
    dp[day][IN_COOLDOWN] = dp[day-1][STOCK_ON_HAND] + price
  end

  # require 'pp'
  # pp dp
  [dp[-1][FREE_TO_BUY], dp[-1][IN_COOLDOWN]].max
end
# @lc code=end

puts max_profit([1,2,3,0,2])

