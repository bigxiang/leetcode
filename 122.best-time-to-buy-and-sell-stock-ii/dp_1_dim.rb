#
# @lc app=leetcode id=122 lang=ruby
#
# [122] Best Time to Buy and Sell Stock II
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit_with_stock = 0
  profit_without_stock = 0

  prices.each_index do |i|
    if i == 0
      profit_with_stock = -prices[0]
      next
    end

    profit_without_stock = [profit_without_stock, profit_with_stock + prices[i]].max
    profit_with_stock = [profit_with_stock, profit_without_stock - prices[i]].max
  end

  profit_without_stock
end
# @lc code=end

