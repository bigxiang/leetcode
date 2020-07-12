#
# @lc app=leetcode id=50 lang=ruby
#
# [50] Pow(x, n)
#

# @lc code=start
# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1.0 if n == 0
  return x if n == 1

  if n < 0
    x = 1 / x
    n = -n
  end

  tmp = my_pow(x, n / 2) ** 2
  n % 2 == 0 ? tmp : tmp * x
end
# @lc code=end

