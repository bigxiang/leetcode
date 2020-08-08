require 'set'
#
# @lc app=leetcode id=127 lang=ruby
#
# [127] Word Ladder
#
# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  word_set = Set.new(word_list)
  return 0 if !word_set.include?(end_word)

  current_level = [[begin_word, 1]]
  while current_level.any?
    new_level = []
    current_level.each do |(word, level)|
      word.chars.each_with_index do |c, i|
        ('a'..'z').each do |new_c|
          next if c == new_c

          new_word = word[0...i] + new_c + word[i+1..-1]
          if new_word == end_word
            return level + 1
          elsif word_set.include?(new_word)
            new_level << [new_word, level + 1]
            word_set.delete(new_word)
          end
        end
      end
    end
    current_level = new_level
  end
  0
end

# @lc code=end
puts ladder_length("hot",
  "dog",
  ["hot","dog"])
