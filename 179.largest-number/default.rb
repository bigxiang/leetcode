#
# @lc app=leetcode.cn id=179 lang=ruby
# @lcpr version=30204
#
# [179] 最大数
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  str = nums.map(&:to_s).sort { |a, b| (b + a) <=> (a + b) }.join
  return '0' if str[0] == '0'

  str
end
# @lc code=end

#
# @lcpr case=start
# [10,2]\n
# @lcpr case=end

# @lcpr case=start
# [3,30,34,5,9]\n
# @lcpr case=end

# @lcpr case=start
# [3,30,34,5,9,91]\n
# @lcpr case=end

# @lcpr case=start
# [0,0]\n
# @lcpr case=end

#
