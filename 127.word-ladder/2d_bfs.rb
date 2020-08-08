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

  start_set = Set.new([begin_word])
  end_set = Set.new([end_word])
  length = 1
  while start_set.any? && end_set.any?
    length += 1
    if start_set.size > end_set.size
      start_set, end_set = end_set, start_set
    end

    new_set = Set.new
    start_set.each do |word|
      word.chars.each_with_index do |c, i|
        ('a'..'z').each do |new_c|
          next if c == new_c

          new_word = word[0...i] + new_c + word[i+1..-1]
          if end_set.include?(new_word)
            return length
          elsif word_set.include?(new_word)
            new_set << new_word
            word_set.delete(new_word)
          end
        end
      end
    end
    start_set = new_set
  end
  0
end
# @lc code=end

# puts ladder_length("hot",
#   "dog",
#   ["hot","dog"])
