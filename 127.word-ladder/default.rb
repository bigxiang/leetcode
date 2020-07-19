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

  graph = build_graph(begin_word, word_list)
  begin_visited = { begin_word => 1 }
  end_visited = { end_word => 1 }
  begin_queue = [[begin_word, 1]]
  end_queue = [[end_word, 1]]

  while begin_queue.any? && end_queue.any?
    length =
      visit_node(begin_queue, begin_visited, end_visited, graph) ||
      visit_node(end_queue, end_visited, begin_visited, graph)

    return length if length
  end

  0
end

def build_graph(begin_word, word_list)
  (word_list << begin_word).each_with_object({}) do |word, graph|
    word.length.times do |i|
      word_pattern = word[0...i] + '*' + word[i+1..-1]
      graph[word_pattern] ||= []
      graph[word_pattern] << word

      graph[word] ||= []
      graph[word] << word_pattern
    end
  end
end

def visit_node(queue, visited, other_visited, graph)
  word, level = queue.shift
  graph[word].each do |word_pattern|
    graph[word_pattern].each do |word_for_ladder|
      return level + other_visited[word_for_ladder] if other_visited.key?(word_for_ladder)

      next if visited.key?(word_for_ladder)

      queue << [word_for_ladder, level + 1]
      visited[word_for_ladder] = level + 1
    end
  end

  nil
end
# @lc code=end
