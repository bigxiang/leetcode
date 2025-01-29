#
# @lc app=leetcode.cn id=692 lang=ruby
# @lcpr version=30204
#
# [692] 前K个高频单词
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  word_count = words.each_with_object({}) do |word, hash|
    hash[word] ||= 0
    hash[word] += 1
  end

  heap = Heap.new do |a, b|
    a.count > b.count || (a.count == b.count && a.word < b.word)
  end

  word_count.each do |word, count|
    heap.push(OpenStruct.new(word:, count:))
  end

  result = []
  k.times do
    result.push(heap.pop.word)
  end
  result
end

class Heap
  attr_reader :comparison_proc, :data

  def initialize(&comparison_proc)
    @data = [0]
    @comparison_proc = comparison_proc
  end

  def top
    data[1]
  end

  def push(val)
    data.push(val)
    push_up(data.size - 1)
  end

  def pop
    return if data.size == 1

    data[1], data[-1] = data[-1], data[1]
    data.pop.tap { push_down(1) }
  end

  private

  def push_up(index)
    return if index == 1

    parent_index = index / 2
    return if comparison_proc.call(data[parent_index], data[index])

    data[parent_index], data[index] = data[index], data[parent_index]
    push_up(parent_index)
  end

  def push_down(index)
    left_index = index * 2
    return if left_index >= data.size

    target_index = index
    target_index = left_index unless comparison_proc.call(data[target_index], data[left_index])

    right_index = index * 2 + 1
    if right_index < data.size && !comparison_proc.call(data[target_index], data[right_index])
      target_index = right_index
    end

    return unless target_index != index

    data[target_index], data[index] = data[index], data[target_index]
    push_down(target_index)
  end
end
# @lc code=end

#
# @lcpr case=start
# ["i", "love", "leetcode", "i", "love", "coding"]\n2\n
# @lcpr case=end

# @lcpr case=start
# ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"]\n4\n
# @lcpr case=end

#
