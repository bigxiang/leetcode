#
# @lc app=leetcode.cn id=2239 lang=ruby
# @lcpr version=30204
#
# [2239] 找到最接近 0 的数字
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_closest_number(nums)
  result = Float::INFINITY
  nums.each do |num|
    result = num if num.abs < result.abs || num.abs == result.abs && num > result
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# [-4,-2,1,4,8]\n
# @lcpr case=end

# @lcpr case=start
# [2,-1,1]\n
# @lcpr case=end

# @lcpr case=start
# [100]\n
# @lcpr case=end

#
