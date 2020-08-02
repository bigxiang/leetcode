#
# @lc app=leetcode id=188 lang=ruby
#
# [188] Best Time to Buy and Sell Stock IV
#

# @lc code=start
# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
WITHOUT_STOCK = 0
WITH_STOCK = 1

def max_profit(k, prices)
  return 0 if prices.empty?

  if k >= prices.size / 2
    return max_profit_without_limit(prices)
  end

  prev = Array.new(2) { Array.new(k+1, -Float::INFINITY) }
  curr = Array.new(2) { Array.new(k+1, -Float::INFINITY) }

  prices.each_with_index do |price, day|
    if day.zero?
      curr[WITHOUT_STOCK][0] = 0
      curr[WITH_STOCK][0] = -price
      next
    end

    prev[WITHOUT_STOCK] = curr[WITHOUT_STOCK].dup
    prev[WITH_STOCK] = curr[WITH_STOCK].dup
    curr[WITHOUT_STOCK][0] = 0

    (0..k).each do |trx_num|
      curr[WITHOUT_STOCK][trx_num] =
        if trx_num.zero?
          prev[WITHOUT_STOCK][trx_num]
        else
          [
            prev[WITHOUT_STOCK][trx_num],
            prev[WITH_STOCK][trx_num-1] + price
          ].max
        end

      curr[WITH_STOCK][trx_num] = [
        prev[WITH_STOCK][trx_num],
        prev[WITHOUT_STOCK][trx_num] - price
      ].max
    end
  end

  # require 'pp'
  # pp prev
  # pp curr
  curr[WITHOUT_STOCK].max
end

def max_profit_without_limit(prices)
  with_s = 0
  without_s = 0

  prices.each_with_index do |p, i|
    if i.zero?
      with_s = -p
      without_s = 0
      next
    end

    without_s, with_s = [with_s + p, without_s].max, [without_s - p , with_s].max
  end

  without_s
end
# @lc code=end

puts max_profit(2, [2,4,1])
puts max_profit(2, [3,2,6,5,0,3])
puts max_profit(3, [3,3,5,0,0,3,1,4])
