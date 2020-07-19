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
  return 0 unless word_list.include?(end_word)

  word_set = Set.new(word_list)
  begin_visited = { begin_word => 1 }
  end_visited = { end_word => 1 }
  begin_queue = [[begin_word, 1]]
  end_queue = [[end_word, 1]]

  while begin_queue.any? && end_queue.any?
    length = visit_node(begin_queue, begin_visited, end_visited, word_set)
    return length if length > -1

    length = visit_node(end_queue, end_visited, begin_visited, word_set)
    return length if length > -1
  end

  0
end

def visit_node(queue, visited, other_visited, word_set)
  node = queue.shift
  word = node[0]
  level = node[1]

  word.length.times do |i|
    ('a'..'z').each do |c|
      next if c == word[i]
      length = i - 0
      word_for_ladder = word[0, length] + c + word[i+1..-1]

      if word_set.include?(word_for_ladder)
        return level + other_visited[word_for_ladder] if other_visited.key?(word_for_ladder)

        next if visited.key?(word_for_ladder)

        queue << [word_for_ladder, level + 1]
        visited[word_for_ladder] = level + 1
      end
    end
  end

  -1
end
# @lc code=end
