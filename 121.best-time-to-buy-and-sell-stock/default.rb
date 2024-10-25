#
# @lc app=leetcode id=121 lang=ruby
#
# [121] Best Time to Buy and Sell Stock
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  min_price = prices[0]
  max_profit = 0
  (1..prices.size - 1).each do |i|
    max_profit = [max_profit, prices[i] - min_price].max
    min_price = [min_price, prices[i]].min
  end
  max_profit
end
# @lc code=end

puts max_profit([7, 1, 5, 3, 6, 4])
puts max_profit([7, 6, 4, 3, 1])
puts max_profit([])
