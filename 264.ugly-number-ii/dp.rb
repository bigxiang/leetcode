#
# @lc app=leetcode id=264 lang=ruby
#
# [264] Ugly Number II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  result = [1]
  i2 = 0
  i3 = 0
  i5 = 0

  (1..n-1).each do |i|
    min = [result[i2] * 2, result[i3] * 3, result[i5] * 5].min
    result << min
    i2 += 1 if min == result[i2] * 2
    i3 += 1 if min == result[i3] * 3
    i5 += 1 if min == result[i5] * 5
  end

  result.last
end
# @lc code=end

