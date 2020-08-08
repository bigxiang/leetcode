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
  NQueen.new(n).solve
end

class NQueen
  attr_reader :n, :queens, :cols, :hills, :dales, :results

  def initialize(n)
    @n = n
    @results = []
    @queens = Array.new(n, 0)
    @cols = Set.new
    @hills = Set.new
    @dales = Set.new
  end

  def solve
    dfs(0)
    results
  end

  private

  def dfs(row)
    return results << parse_queens if row == n

    (0..n-1).each do |col|
      next if cols.include?(col) || dales.include?(row-col) || hills.include?(row+col)

      place_queen(row, col)
      dfs(row+1)
      remove_queen(row, col)
    end
  end

  def parse_queens
    queens.map do |queen|
      str = '.' * n
      str[queen] = 'Q'
      str
    end
  end

  def place_queen(row, col)
    queens[row] = col
    cols.add(col)
    dales.add(row-col)
    hills.add(row+col)
  end

  def remove_queen(row, col)
    queens[row] = 0
    cols.delete(col)
    dales.delete(row-col)
    hills.delete(row+col)
  end
end
# @lc code=end

puts solve_n_queens(4)
puts solve_n_queens(8)
