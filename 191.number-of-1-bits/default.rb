#
# @lc app=leetcode id=191 lang=ruby
#
# [191] Number of 1 Bits
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  n != 0 ? 1 + hamming_weight(n & (n - 1)) : 0
end
# @lc code=end

