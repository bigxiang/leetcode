#
# @lc app=leetcode id=279 lang=ruby
#
# [279] Perfect Squares
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def num_squares(n)
  return 1 if perfect_squares?(n)

  dp = Array.new(n+1, Float::INFINITY)
  dp[1] = 1
  last_perfect_squares = [1]

  (2..n).each do |i|
    if perfect_squares?(i)
      last_perfect_squares << i
      dp[i] = 1
      next
    end

    last_perfect_squares.each do |s|
      dp[i] = [dp[i], dp[s] + dp[i - s]].min
    end
  end

  # require 'pp'
  # pp dp
  dp[n]
end

def perfect_squares?(n)
  sqrt = Math.sqrt(n)
  sqrt.to_i == sqrt
end
# @lc code=end

puts num_squares(5)
puts num_squares(12)
puts num_squares(99)
