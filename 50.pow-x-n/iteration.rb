#
# @lc app=leetcode id=50 lang=ruby
#
# [50] Pow(x, n)
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return my_pow(1 / x, -n) if n < 0

  return 1.0 if n == 0
  return x if n == 1

  result = 1
  i = 0
  while n > 0
    d = n & 1
    result *= x**(2**i) if d == 1
    i += 1
    n >>= 1
  end
  result
end
# @lc code=end

# @lcpr case=start
# 2.00000\n10\n
# @lcpr case=end

# @lcpr case=start
# 2.10000\n3\n
# @lcpr case=end

# @lcpr case=start
# 2.00000\n-2\n
# @lcpr case=end

# @lcpr case=start
# 2.00000\n0\n
# @lcpr case=end

# @lcpr case=start
# 0\n1\n
# @lcpr case=end
