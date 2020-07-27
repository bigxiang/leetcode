#
# @lc app=leetcode id=392 lang=ruby
#
# [392] Is Subsequence
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s.empty?

  s_index = 0

  t.chars.each do |c|
    s_index += 1 if c == s[s_index]
  end

  s_index == s.size
end
# @lc code=end

puts is_subsequence('', 'ahbgdc')
