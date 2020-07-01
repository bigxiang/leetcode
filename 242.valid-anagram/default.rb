#
# @lc app=leetcode id=242 lang=ruby
#
# [242] Valid Anagram
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  chars_count_map =
    s.chars.each_with_object(Hash.new(0)) do |c, memo|
      memo[c] += 1
    end

  t.chars.each do |c|
    return false unless chars_count_map.key?(c)

    chars_count_map[c] -= 1 if chars_count_map[c] > 0
  end

  !chars_count_map.values.any? { |count| count > 0 }
end
# @lc code=end

