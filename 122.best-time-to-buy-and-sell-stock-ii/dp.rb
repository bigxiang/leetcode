#
# @lc app=leetcode id=122 lang=ruby
#
# [122] Best Time to Buy and Sell Stock II
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  dp = Array.new(prices.size) { Array.new(2, 0) }

  prices.each_index do |i|
    if i == 0
      dp[0] = [0, -prices[0]]
      next
    end

    dp[i][0] = [dp[i-1][0], dp[i-1][1] + prices[i]].max
    dp[i][1] = [dp[i-1][1], dp[i-1][0] - prices[i]].max
  end

  dp[-1][0]
end
# @lc code=end

