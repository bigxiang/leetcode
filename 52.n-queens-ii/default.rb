require 'pp'
#
# @lc app=leetcode id=52 lang=ruby
#
# [52] N-Queens II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  @count = 0
  dfs(n, 0, 0, 0, 0)
  @count
end

def dfs(n, row, col, hill_in_col, dale_in_col)
  if row >= n
    return @count += 1
  end

  current_row_bits = ~(col | hill_in_col | dale_in_col) & ((1 << n) - 1)
  while current_row_bits > 0
    pick = current_row_bits & -current_row_bits
    dfs(n, row + 1, col | pick, (hill_in_col | pick) << 1, (dale_in_col | pick) >> 1)
    current_row_bits &= current_row_bits - 1
  end
end
# @lc code=end

puts total_n_queens(9)
