#
# @lc app=leetcode id=387 lang=ruby
#
# [387] First Unique Character in a String
#

# @lc code=start
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  counter = Array.new(26, 0)
  s.chars.each { |c| counter[c.ord - 'a'.ord] += 1 }
  s.chars.each_with_index { |c, i| return i if counter[c.ord - 'a'.ord] == 1 }
  -1
end
# @lc code=end

puts first_uniq_char('leetcode')
puts first_uniq_char('loveleetcode')
puts first_uniq_char('aabbcc')
