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

  max_hold = -Float::INFINITY
  max = 0

  prices.each_with_index do |p, i|
    max_hold, max = [max_hold, -p].max, [max, max_hold + p].max
  end

  max
end
# @lc code=end

puts max_profit([7,1,5,3,6,4])
puts max_profit([7,6,4,3,1])
puts max_profit([])
