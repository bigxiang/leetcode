#
# @lc app=leetcode id=387 lang=ruby
#
# [387] First Unique Character in a String
#

# @lc code=start
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  s.chars
    .each_with_index
    .each_with_object(Hash.new { |h, k| h[k] = [] }) { |(c, i), h| h[c] << i }
    .detect { |_, v| v.size == 1 }
    &.last&.first || -1
end
# @lc code=end

puts first_uniq_char('leetcode')
puts first_uniq_char('loveleetcode')
puts first_uniq_char('aabbcc')
