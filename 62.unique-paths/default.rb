#
# @lc app=leetcode id=62 lang=ruby
#
# [62] Unique Paths
#

# @lc code=start
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(m+1, 1)

  (n-1).times do
    (2..m).each { |j| dp[j] += dp[j-1] }
  end

  dp[-1]
end
# @lc code=end

