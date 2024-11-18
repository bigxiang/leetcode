#
# @lc app=leetcode.cn id=336 lang=ruby
# @lcpr version=30204
#
# [336] 回文对
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
  root = Node.new
  words.each_with_index { |word, i| build_nodes(word, i, root) }

  answers = []
  words.each_with_index do |word, i|
    node = root
    node.indice.each do |index|
      answers << [i, index] if i != index && palindrome?(word)
    end

    (0..word.size - 1).each do |j|
      node = node.children[word[j]]
      break if node.nil?

      node.indice.each do |index|
        if words[index].length == word.length
          answers << [i, index] if i != index
        elsif palindrome?(word[j + 1..])
          answers << [i, index]
        end
      end
    end

    next if node.nil?

    node.suffix_indice.each do |index|
      answers << [i, index] if i != index
    end
  end

  answers
end

def build_nodes(word, i, root)
  node = root
  node.indice << i if word.empty?
  node.suffix_indice << i if palindrome?(word)

  (word.size - 1).downto(0) do |j|
    c = word[j]
    node.children[c] ||= Node.new
    if j.zero?
      node.children[c].indice << i
    elsif palindrome?(word[0...j])
      node.children[c].suffix_indice << i
    end
    node = node.children[c]
  end
end

def palindrome?(str)
  left = 0
  right = str.size - 1
  while left < right
    return false if str[left] != str[right]

    left += 1
    right -= 1
  end
  true
end

class Node
  attr_accessor :children, :indice, :suffix_indice

  def initialize
    @children = {}
    @indice = []
    @suffix_indice = []
  end
end
# @lc code=end

#
# @lcpr case=start
# ["abcd","dcba","lls","s","sssll"]\n
# @lcpr case=end

# @lcpr case=start
# ["bat","tab","cat"]\n
# @lcpr case=end

# @lcpr case=start
# ["a",""]\n
# @lcpr case=end

#
