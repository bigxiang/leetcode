#
# @lc app=leetcode.cn id=125 lang=ruby
# @lcpr version=30204
#
# [125] 验证回文串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  left = 0
  right = s.size - 1
  while left <= right
    unless letter?(s[left])
      left += 1
      next
    end
    unless letter?(s[right])
      right -= 1
      next
    end

    return false if s[left].downcase != s[right].downcase

    left += 1
    right -= 1
  end
  true
end

def letter?(char)
  ord = char.ord
  ord >= 65 && ord <= 90 || ord >= 97 && ord <= 122 || ord >= 48 && ord <= 57
end
# @lc code=end



#
# @lcpr case=start
# "A man, a plan, a canal: Panama"\n
# @lcpr case=end

# @lcpr case=start
# "race a car"\n
# @lcpr case=end

# @lcpr case=start
# " "\n
# @lcpr case=end

# @lcpr case=start
# "s"\n
# @lcpr case=end

# @lcpr case=start
# "s "\n
# @lcpr case=end

 # @lcpr case=start
# "0P"\n
# @lcpr case=end

#

