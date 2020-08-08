require 'set'
require 'pp'
#
# @lc app=leetcode id=37 lang=ruby
#
# [37] Sudoku Solver
#

# @lc code=start
# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  Sudoku.new(board).solve
end

class Sudoku
  attr_reader :board, :all_digits, :rows, :cols, :blks

  def initialize(board)
    @board = board
    @all_digits = Set.new('1'..'9')
    @rows = Array.new(9) { Set.new }
    @cols = Array.new(9) { Set.new }
    @blks = Array.new(9) { Set.new }

    board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        next if cell == '.'
        rows[i] << cell
        cols[j] << cell
        blks[blk_index(i, j)] << cell
      end
    end
  end

  def solve
    dfs(0)
  end

  private

  def dfs(n)
    return true if n == 81

    i = n / 9
    j = n % 9

    if board[i][j] != '.'
      dfs(n+1)
    else
      (all_digits - rows[i] - cols[j] - blks[blk_index(i, j)]).each do |digit|
        assign_digit(i, j ,digit)
        return true if dfs(n+1)
        remove_digit(i, j ,digit)
      end

      false
    end
  end

  def assign_digit(i, j ,digit)
    board[i][j] = digit
    rows[i] << digit
    cols[j] << digit
    blks[blk_index(i, j)] << digit
  end

  def remove_digit(i, j, digit)
    board[i][j] = '.'
    rows[i].delete(digit)
    cols[j].delete(digit)
    blks[blk_index(i, j)].delete(digit)
  end

  def blk_index(i, j)
    i / 3 * 3 + j / 3
  end
end

# @lc code=end

board = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
solve_sudoku(board)
pp board

board = [[".",".","9","7","4","8",".",".","."],["7",".",".",".",".",".",".",".","."],[".","2",".","1",".","9",".",".","."],[".",".","7",".",".",".","2","4","."],[".","6","4",".","1",".","5","9","."],[".","9","8",".",".",".","3",".","."],[".",".",".","8",".","3",".","2","."],[".",".",".",".",".",".",".",".","6"],[".",".",".","2","7","5","9",".","."]]

solve_sudoku(board)
pp board
