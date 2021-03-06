#
# @lc app=leetcode id=121 lang=ruby
#
# [121] Best Time to Buy and Sell Stock
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  dp = Array.new(prices.size) { Array.new(2, -Float::INFINITY) }

  prices.each_with_index do |p, i|
    if i == 0
      dp[0][0] = 0
      dp[0][1] = -p
      next
    end

    dp[i][1] = [dp[i-1][1], -p].max
    dp[i][0] = [dp[i-1][0], dp[i-1][1] + p].max
  end

  dp[-1][0]
end
# @lc code=end

puts max_profit([7,1,5,3,6,4])
puts max_profit([7,6,4,3,1])
puts max_profit([])
