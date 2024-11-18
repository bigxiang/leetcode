#
# @lc app=leetcode.cn id=5 lang=ruby
# @lcpr version=30204
#
# [5] 最长回文子串
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {String}
def longest_palindrome(s)
  answer = ''
  (0...s.size).each do |i|
    left = right = i
    while left >= 0 && right < s.size && s[left] == s[right]
      left -= 1
      right += 1
    end
    substring = s[(left + 1)..(right - 1)]
    answer = substring if substring.size > answer.size

    left = i
    right = i + 1
    while left >= 0 && right < s.size && s[left] == s[right]
      left -= 1
      right += 1
    end
    substring = s[(left + 1)..(right - 1)]
    answer = substring if substring.size > answer.size
  end
  answer
end
# @lc code=end

#
# @lcpr case=start
# "babad"\n
# @lcpr case=end

# @lcpr case=start
# "cbbd"\n
# @lcpr case=end

# @lcpr case=start
# "c"\n
# @lcpr case=end

# @lcpr case=start
# "babab"\n
# @lcpr case=end

# @lcpr case=start
# "babbab"\n
# @lcpr case=end

# @lcpr case=start
# "bcdbab"\n
# @lcpr case=end

#
