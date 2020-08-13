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
  return false if s.size != t.size

  chars_map = s.chars.each_with_object(Hash.new(0)) { |c, memo| memo[c] += 1 }

  t.chars.each do |c|
    chars_map[c] -= 1
    return false if chars_map[c] < 0
  end

  true
end
# @lc code=end

