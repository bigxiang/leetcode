#
# @lc app=leetcode.cn id=79 lang=ruby
# @lcpr version=30204
#
# [79] 单词搜索
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  board_char_map = {}
  board.each do |row|
    row.each do |cell|
      board_char_map[cell] ||= 0
      board_char_map[cell] += 1
    end
  end

  word_char_map = {}
  word.each_char do |char|
    word_char_map[char] ||= 0
    word_char_map[char] += 1
  end

  word_char_map.each do |char, count|
    return false if (board_char_map[char] || 0) < count
  end

  word = word.reverse if word_char_map[word[0]] > word_char_map[word[-1]]

  board.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      next if cell != word[0]

      return true if dfs(board, i, j, word, 0, {})
    end
  end

  false
end

def dfs(board, i, j, word, k, visited)
  return true if k >= word.size

  return false if i < 0 || j < 0 || i >= board.size || j >= board[0].size
  return false if visited[[i, j]]
  return false if board[i][j] != word[k]

  visited[[i, j]] = true

  result = dfs(board, i + 1, j, word, k + 1, visited) ||
           dfs(board, i - 1, j, word, k + 1, visited) ||
           dfs(board, i, j + 1, word, k + 1, visited) ||
           dfs(board, i, j - 1, word, k + 1, visited)

  visited[[i, j]] = false
  result
end
# @lc code=end

#
# @lcpr case=start
# [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"ABCCED"\n
# @lcpr case=end

# @lcpr case=start
# [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"SEE"\n
# @lcpr case=end

# @lcpr case=start
# [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"ABCB"\n
# @lcpr case=end

# @lcpr case=start
# [["C","A","A"],["A","A","A"],["B","C","D"]]\n"AAB"\n
# @lcpr case=end

# @lcpr case=start
# [["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]]\n"ABCESEEEFS"\n
# @lcpr case=end

# @lcpr case=start
# [["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"]]\n"AAAAAAAAAAAAAAB"\n
# @lcpr case=end
#
