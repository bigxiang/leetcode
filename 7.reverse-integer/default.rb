#
# @lc app=leetcode.cn id=7 lang=ruby
# @lcpr version=30204
#
# [7] 整数反转
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} x
# @return {Integer}
def reverse(x)
  min = (-2**31.to_f / 10).ceil
  min_last = -2**31 - min * 10
  max = (2**31 - 1) / 10
  max_last = (2**31 - 1) % 10

  result = 0
  while x != 0
    next_x = x.positive? ? x / 10 : (x.to_f / 10).ceil
    last_d = x - next_x * 10
    return 0 if result > max || (result == max && last_d > max_last)
    return 0 if result < min || (result == min && last_d < min_last)

    result = result * 10 + last_d
    x = next_x
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# 123\n
# @lcpr case=end

# @lcpr case=start
# -123\n
# @lcpr case=end

# @lcpr case=start
# 120\n
# @lcpr case=end

# @lcpr case=start
# 0\n
# @lcpr case=end

#
