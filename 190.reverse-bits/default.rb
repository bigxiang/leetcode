#
# @lc app=leetcode id=190 lang=ruby
#
# [190] Reverse Bits
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  new_num = 0
  32.times do
    new_num = new_num << 1 | n & 1
    n >>= 1
  end
  new_num
end
# @lc code=end

