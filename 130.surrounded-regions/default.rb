require 'pp'
#
# @lc app=leetcode id=130 lang=ruby
#
# [130] Surrounded Regions
#

# @lc code=start
# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  return board if board.empty? || board[0].empty?

  m = board.size
  n = board[0].size
  di = 0
  dj = 1
  i = 0
  j = -1

  (2*m + 2*(n-2) + 1).times do
    if i + di < 0 || i + di == m || j + dj < 0 || j + dj == n
      di, dj = dj, -di
    end

    i += di
    j += dj

    next if board[i][j] == 'X' || board[i][j] == 'V'

    dfs(board, i, j)
  end

  board.each do |row|
    row.each_with_index do |cell, j|
      row[j] = 'X' if cell == 'O'
      row[j] = 'O' if cell == 'V'
    end
  end
end

def dfs(board, i, j)
  return if board[i][j] == 'X' || board[i][j] == 'V'

  board[i][j] = 'V'

  [[0,1], [1,0], [-1,0], [0,-1]].each do |(di, dj)|
    if i + di >= 0 && i + di < board.size && j + dj >= 0 && j + dj < board[0].size
      dfs(board, i+di, j+dj)
    end
  end
end

# @lc code=end

puts solve(
  [
    ["X","X","X","X"],
    ["X","O","O","X"],
    ["X","X","O","X"],
    ["X","O","X","X"]
  ]
)
