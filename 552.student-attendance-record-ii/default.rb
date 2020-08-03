#
# @lc app=leetcode id=552 lang=ruby
#
# [552] Student Attendance Record II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def check_record(n)
  m = 10 ** 9 + 7
  dp = Array.new(n+1)
  dp[0] = 1
  dp[1] = 2
  dp[2] = 4
  dp[3] = 7
  (4..n).each do |i|
    dp[i] = (2 * dp[i-1] - dp[i-4]) % m
  end
  result = dp[n]
  (1..n).each do |i|
    result += dp[i-1] * dp[n-i] % m
  end
  result % m
end
# @lc code=end

# climbing stairs
