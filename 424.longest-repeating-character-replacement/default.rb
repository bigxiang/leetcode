#
# @lc app=leetcode.cn id=424 lang=ruby
# @lcpr version=30204
#
# [424] 替换后的最长重复字符
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  a_ord = 'A'.ord
  count = Array.new(26, 0)
  max_count = left = right = 0
  while right < s.size
    right_ord = s[right].ord - a_ord
    count[right_ord] += 1
    max_count = [max_count, count[right_ord]].max
    if right - left + 1 - max_count > k
      count[s[left].ord - a_ord] -= 1
      left += 1
    end
    right += 1
  end

  right - left
end
# @lc code=end

#
# @lcpr case=start
# "ABAB"\n2\n
# @lcpr case=end

# @lcpr case=start
# "ABBB"\n2\n
# @lcpr case=end

# @lcpr case=start
# "ABBBA"\n2\n
# @lcpr case=end

# @lcpr case=start
# "AABABBA"\n1\n
# @lcpr case=end

# @lcpr case=start
# "AABABBA"\n0\n
# @lcpr case=end

# @lcpr case=start
# "A"\n0\n
# @lcpr case=end

#
