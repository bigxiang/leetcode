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
  k = n / 2 + 1
  memo = Array.new(n+1) { Array.new(k+1, -1) }
  (2..k).map { |nums| max_product(n, nums, memo) }.max
end

def max_product(n, k, memo)
  return memo[n][k] if memo[n][k] > -1
  return n if k == 1

  memo[n][k] = (1..n-k+1).map { |i| max_product(n-i, k-1, memo) * i }.max
end
# @lc code=end

# puts integer_break(2)
# puts integer_break(6)
# puts integer_break(9)
# puts integer_break(10)
# puts integer_break(11)
puts integer_break(58)

