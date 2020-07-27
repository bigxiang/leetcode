#
# @lc app=leetcode id=258 lang=ruby
#
# [258] Add Digits
#

# @lc code=start
# @param {Integer} num
# @return {Integer}
def add_digits(num)
  return 0 if num.zero?

  result = num % 9
  result == 0 ? 9 : result
end
# @lc code=end

