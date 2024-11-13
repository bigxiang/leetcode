#
# @lc app=leetcode.cn id=3 lang=ruby
# @lcpr version=30204
#
# [3] 无重复字符的最长子串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  start = -1
  result = 0
  seen = {}
  s.chars.each_with_index do |char, i|
    start = seen[char] if seen[char] && seen[char] > start
    seen[char] = i
    result = [result, i - start].max
  end
  result
end
# @lc code=end



#
# @lcpr case=start
# "abcabcbb"\n
# @lcpr case=end

# @lcpr case=start
# "bbbbb"\n
# @lcpr case=end

# @lcpr case=start
# "pwwkew"\n
# @lcpr case=end

# @lcpr case=start
# "abba"\n
# @lcpr case=end

#

