#
# @lc app=leetcode id=122 lang=ruby
#
# [122] Best Time to Buy and Sell Stock II
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  prices.each_cons(2).reduce(0) do |profit, (price_today, price_tomorrow)|
    price_tomorrow > price_today ? profit + price_tomorrow - price_today : profit
  end
end
# @lc code=end

