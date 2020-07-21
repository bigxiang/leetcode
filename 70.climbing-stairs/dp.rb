#
# @lc app=leetcode id=70 lang=ruby
#
# [70] Climbing Stairs
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  dp = Array.new(n.size+1)

  (1..n).each do |i|
    if i <= 2
      dp[i] = i
    else
      dp[i] = dp[i-1] + dp[i-2]
    end
  end

  dp[n]
end
# @lc code=end

