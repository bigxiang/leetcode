require 'pp'
#
# @lc app=leetcode id=343 lang=ruby
#
# [343] Integer Break
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def integer_break(n)
  dp = Array.new(n+1, -1)
  dp[2] = 1

  (3..n).each do |i|
    max_product_from_2_digits =
      i % 2 == 0 ? (i / 2) ** 2 : i / 2 * (i / 2 + 1)

    max_product_from_dp =
      (1..i-2).map { |added_num| dp[i-added_num] * added_num }.max

    dp[i] = [max_product_from_2_digits, max_product_from_dp].max
  end

  dp[-1]
end
# @lc code=end

# puts integer_break(2)
# puts integer_break(3)
# puts integer_break(4)
# puts integer_break(9)
# puts integer_break(10)
# puts integer_break(11)
puts integer_break(58)

