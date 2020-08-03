require 'byebug'
#
# @lc app=leetcode id=212 lang=ruby
#
# [212] Word Search II
#

# @lc code=start
# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  trie = build_trie(words)

  result = []
  (0..board.size-1).each do |i|
    (0..board[0].size-1).each do |j|
      result += search_words(board, i, j, trie)
    end
  end

  result
end

def build_trie(words)
  root = TrieNode.new

  words.each do |word|
    current_node = root
    word.chars.each do |c|
      if !current_node.children.key?(c)
        current_node.children[c] = TrieNode.new
      end

      current_node = current_node.children[c]
    end
    current_node.word = word
  end

  root
end

def search_words(board, i, j, trie)
  c = board[i][j]
  node = trie.children[c]
  # terminate
  return [] if node.nil?

  # process
  result = []
  if node.word
    result << node.word
    node.word = nil
  end

  # tricky part to mark the current character visited,
  # should reverse after returning from recursion.
  board[i][j] = '*'

  # drill down
  result += search_words(board, i-1, j, node) if i > 0
  result += search_words(board, i, j-1, node) if j > 0
  result += search_words(board, i+1, j, node) if i < board.size - 1
  result += search_words(board, i, j+1, node) if j < board[0].size - 1

  # restore states
  board[i][j] = c

  result
end

class TrieNode
  attr_accessor :word, :children

  def initialize(children = {})
    @children = children
  end
end
# @lc code=end

# puts build_trie(["oath","pea","eat","rain"]).children['o']
# puts find_words(
#   [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]],
#   ["oath","pea","eat","rain"]
# )

puts find_words(
  [["a"]],
  ["a"]
)
