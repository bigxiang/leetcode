#
# @lc app=leetcode id=208 lang=ruby
#
# [208] Implement Trie (Prefix Tree)
#

# @lc code=start
class Trie

=begin
    Initialize your data structure here.
=end
    def initialize()
        @root = TrieNode.new
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        current_node = @root
        word.chars.each do |c|
            if current_node.children.key?(c)
                current_node = current_node.children[c]
            else
                new_node = TrieNode.new
                current_node.children[c] = new_node
                current_node = new_node
            end
        end
        current_node.word = true
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        current_node = @root
        word.chars.each do |c|
            if current_node.children.key?(c)
                current_node = current_node.children[c]
            else
                return false
            end
        end
        current_node.word?
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        current_node = @root
        prefix.chars.each do |c|
            if current_node.children.key?(c)
                current_node = current_node.children[c]
            else
                return false
            end
        end
        true
    end


end

class TrieNode
  attr_accessor :word, :children

  def initialize(children = {})
    @children = children
  end

  def word?
    !@word.nil?
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
# @lc code=end

