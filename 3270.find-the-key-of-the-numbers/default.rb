#
# @lc app=leetcode.cn id=3270 lang=ruby
# @lcpr version=30204
#
# [3270] 求出数字答案
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} num1
# @param {Integer} num2
# @param {Integer} num3
# @return {Integer}
def generate_key(num1, num2, num3)
  nums = [num1, num2, num3]
  divisor = 1000
  result = 0
  4.times do
    digits = []
    (0...nums.size).each do |i|
      digits << (nums[i] / divisor)
      nums[i] %= divisor
    end
    result += digits.min * divisor
    divisor /= 10
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# 1\n10\n1000\n
# @lcpr case=end

# @lcpr case=start
# 987\n879\n798\n
# @lcpr case=end

# @lcpr case=start
# 1\n2\n3\n
# @lcpr case=end

#
