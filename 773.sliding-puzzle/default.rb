require 'set'
#
# @lc app=leetcode id=773 lang=ruby
#
# [773] Sliding Puzzle
#

# @lc code=start
# @param {Integer[][]} board
# @return {Integer}
MOVES = {
  0 => [1, 3],
  1 => [0, 2, 4],
  2 => [1, 5],
  3 => [0, 4],
  4 => [1, 3, 5],
  5 => [2, 4]
}.freeze

def sliding_puzzle(board)
  serialized_board = board.flatten.join
  return 0 if serialized_board == '123450'

  queue = [[serialized_board, 0]]
  visited = Set.new([serialized_board])
  while queue.any?
    cur_board, steps = queue.shift
    zero_pos = cur_board.index('0')
    MOVES[zero_pos].each do |move|
      new_board = cur_board.dup
      new_board[zero_pos], new_board[move] = new_board[move], new_board[zero_pos]

      if new_board == '123450'
        return steps + 1
      elsif !visited.include?(new_board)
        queue << [new_board, steps + 1]
        visited << new_board
      end
    end
  end
  -1
end
# @lc code=end

puts sliding_puzzle([[4,1,2],[5,0,3]])
puts sliding_puzzle([[3,2,4],[1,5,0]])
puts sliding_puzzle([[1,2,3],[5,4,0]])
