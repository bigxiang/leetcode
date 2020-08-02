#
# @lc app=leetcode id=714 lang=ruby
#
# [714] Best Time to Buy and Sell Stock with Transaction Fee
#

# @lc code=start
# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  with_s = 0
  without_s = 0

  prices.each_with_index do |p, i|
    if i.zero?
      with_s = -p
      without_s = 0
      next
    end

    with_s, without_s = [with_s, without_s - p].max, [without_s, with_s + p - fee].max
  end

  without_s
end
# @lc code=end

