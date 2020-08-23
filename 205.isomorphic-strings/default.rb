#
# @lc app=leetcode id=205 lang=ruby
#
# [205] Isomorphic Strings
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  s_char_map = {}
  t_char_map = {}
  (0..s.length - 1).each do |i|
    return false if s_char_map.key?(s[i]) && s_char_map[s[i]] != t[i]
    return false if t_char_map.key?(t[i]) && t_char_map[t[i]] != s[i]
    s_char_map[s[i]] ||= t[i]
    t_char_map[t[i]] ||= s[i]
  end
  true
end
# @lc code=end

