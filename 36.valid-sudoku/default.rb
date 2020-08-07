require 'set'
#
# @lc app=leetcode id=36 lang=ruby
#
# [36] Valid Sudoku
#

# @lc code=start
# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rows = Array.new(board.size) { Set.new }
  cols = Array.new(board.size) { Set.new }
  blks = Array.new(board.size) { Set.new }

  (0..board.size-1).each do |i|
    (0..board[0].size-1).each do |j|
      next if board[i][j] == '.'

      digit = board[i][j]

      if rows[i].include?(digit) || cols[j].include?(digit) || blks[to_blk_index(i, j)].include?(digit)
        return false
      else
        rows[i] << digit
        cols[j] << digit
        blks[to_blk_index(i, j)] << digit
      end
    end
  end

  true
end

def to_blk_index(i, j)
  i / 3 * 3 + j / 3
end
# @lc code=end

board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
puts is_valid_sudoku(board)
