#
# @lc app=leetcode.cn id=9 lang=ruby
# @lcpr version=30204
#
# [9] 回文数
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  return true if  x == 0
  return false if x % 10 == 0

  rev = 0
  while x > rev
    d = x % 10
    x /= 10
    return true if x == rev

    rev = rev * 10 + d
  end
  rev == x
end
# @lc code=end

#
# @lcpr case=start
# 121\n
# @lcpr case=end

# @lcpr case=start
# -121\n
# @lcpr case=end

# @lcpr case=start
# 10\n
# @lcpr case=end

# @lcpr case=start
# 101\n
# @lcpr case=end

#
