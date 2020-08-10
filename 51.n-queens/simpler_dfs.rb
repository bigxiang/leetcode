require 'pp'
#
# @lc app=leetcode id=51 lang=ruby
#
# [51] N-Queens
#

# @lc code=start
# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  results = []
  dfs([], [], [], results, n)
  results.map { |queens| queens.map { |q| "." * q + 'Q' + '.' * (n-q-1) } }
end

def dfs(queens, dales, hills, results, n)
  i = queens.size - 1
  return results << queens if i == n - 1

  n.times do |j|
    next if queens.include?(j) || dales.include?(i-j) || hills.include?(i+j)
    dfs(queens + [j], dales + [i-j], hills + [i+j], results, n)
  end
end
# @lc code=end

puts solve_n_queens(4)
puts solve_n_queens(8)
