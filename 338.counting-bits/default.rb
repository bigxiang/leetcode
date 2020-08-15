#
# @lc app=leetcode id=338 lang=ruby
#
# [338] Counting Bits
#

# @lc code=start
# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  dp = Array.new(num+1, 0)
  (1..num).each do |i|
    dp[i] = dp[i >> 1] + (i & 1)
  end
  dp
end
# @lc code=end

