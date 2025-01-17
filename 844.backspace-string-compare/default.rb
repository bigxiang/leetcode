#
# @lc app=leetcode.cn id=844 lang=ruby
# @lcpr version=30204
#
# [844] 比较含退格的字符串
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  i = s.size - 1
  j = t.size - 1
  bs_i = 0
  bs_j = 0
  while i >= 0 || j >= 0
    if i >= 0
      if s[i] == '#'
        bs_i += 1
        i -= 1
        next
      elsif bs_i > 0
        bs_i -= 1
        i -= 1
        next
      end
    end

    if j >= 0
      if t[j] == '#'
        bs_j += 1
        j -= 1
        next
      elsif bs_j > 0
        bs_j -= 1
        j -= 1
        next
      end
    end

    return false if i < 0 || j < 0
    return false if s[i] != t[j]

    i -= 1
    j -= 1
  end
  true
end
# @lc code=end

#
# @lcpr case=start
# "ab#c"\n"ad#c"\n
# @lcpr case=end

# @lcpr case=start
# "ab##"\n"c#d#"\n
# @lcpr case=end

# @lcpr case=start
# "a#c"\n"b"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n"b"\n
# @lcpr case=end

# @lcpr case=start
# "#b"\n"b"\n
# @lcpr case=end

#
