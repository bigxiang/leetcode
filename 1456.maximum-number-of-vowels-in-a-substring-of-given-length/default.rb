#
# @lc app=leetcode.cn id=1456 lang=ruby
# @lcpr version=30204
#
# [1456] 定长子串中元音的最大数目
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {Integer}
def max_vowels(s, k)
  ans = 0
  count = 0
  (0..s.size - 1).each do |i|
    count += 1 if vowel?(s[i])

    next unless i >= k - 1

    ans = [ans, count].max

    count -= 1 if vowel?(s[i - k + 1])
  end
  ans
end

def vowel?(letter)
  %w[a e i o u].include?(letter)
end
# @lc code=end

#
# @lcpr case=start
# "abciiidef"\n3\n
# @lcpr case=end

# @lcpr case=start
# "aeiou"\n2\n
# @lcpr case=end

# @lcpr case=start
# "leetcode"\n3\n
# @lcpr case=end

# @lcpr case=start
# "rhythms"\n4\n
# @lcpr case=end

# @lcpr case=start
# "tryhard"\n4\n
# @lcpr case=end

#
