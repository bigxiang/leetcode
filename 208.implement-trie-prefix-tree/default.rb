#
# @lc app=leetcode id=208 lang=ruby
#
# [208] Implement Trie (Prefix Tree)
#

# @lc code=start
class Trie
    class Node
      attr_reader :children

      def initialize
        @children = Array.new(26)
        @is_word = false
      end

      def word?
        @is_word
      end

      def set_to_word
        @is_word = true
      end
    end

    attr_reader :root
=begin
    Initialize your data structure here.
=end
    def initialize
      @root = Node.new
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        curr = root
        word.chars.each do |c|
          curr = (curr.children[c.ord - 'a'.ord] ||= Node.new)
        end
        curr.set_to_word
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      search_word(word)
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
      search_word(prefix, true)
    end

    private

    def search_word(word, prefix = false)
      curr = root
      word.chars.each do |c|
        curr = curr.children[c.ord - 'a'.ord]
        return false if curr.nil?
      end
      prefix || curr.word?
    end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
# @lc code=end

