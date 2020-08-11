#
# @lc app=leetcode id=190 lang=ruby
#
# [190] Reverse Bits
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  n = n >> 16 | n << 16
  n = (n & 0xFF00FF00) >> 8 | (n & 0x00FF00FF) << 8
  n = (n & 0xF0F0F0F0) >> 4 | (n & 0x0F0F0F0F) << 4
  n = (n & 0xCCCCCCCC) >> 2 | (n & 0x33333333) << 2
  (n & 0xAAAAAAAA) >> 1 | (n & 0x55555555) << 1
end
# @lc code=end

