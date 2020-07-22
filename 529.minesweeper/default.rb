#
# @lc app=leetcode id=529 lang=ruby
#
# [529] Minesweeper
#

# @lc code=start
# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
  i, j = click
  if board[i][j] == 'M'
    board[i][j] = 'X'
    return board
  end

  reveal(board, i, j)
  board
end

def reveal(board, i, j)
  if board[i][j] != 'E'
    return
  end

  mine_count = 0
  adjustcents = []

  if i > 0
    adjustcents << [i-1, j]
    mine_count += 1 if board[i-1][j] == 'M'
  end

  if j > 0
    adjustcents << [i, j-1]
    mine_count += 1 if board[i][j-1] == 'M'
  end

  if i < board.size-1
    adjustcents << [i+1, j]
    mine_count += 1 if board[i+1][j] == 'M'
  end

  if j < board[0].size-1
    adjustcents << [i, j+1]
    mine_count += 1 if board[i][j+1] == 'M'
  end

  if i > 0 && j > 0
    adjustcents << [i-1, j-1]
    mine_count += 1 if board[i-1][j-1] == 'M'
  end

  if i > 0 && j < board[0].size-1
    adjustcents << [i-1, j+1]
    mine_count += 1 if board[i-1][j+1] == 'M'
  end

  if j > 0 && i < board.size-1
    adjustcents << [i+1, j-1]
    mine_count += 1 if board[i+1][j-1] == 'M'
  end

  if i < board.size-1 && j < board[0].size-1
    adjustcents << [i+1, j+1]
    mine_count += 1 if board[i+1][j+1] == 'M'
  end

  if mine_count == 0
    board[i][j] = 'B'
    adjustcents.each do |adjustcent|
      reveal(board, *adjustcent)
    end
  else
    board[i][j] = mine_count.to_s
  end
end
# @lc code=end

