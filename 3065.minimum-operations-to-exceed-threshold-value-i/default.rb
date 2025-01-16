#
# @lc app=leetcode.cn id=3065 lang=ruby
# @lcpr version=30204
#
# [3065] 超过阈值的最少操作数 I
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
  nums.count { |n| n < k }
end
# @lc code=end

#
# @lcpr case=start
# [2,11,10,1,3]\n10\n
# @lcpr case=end

# @lcpr case=start
# [1,1,2,4,9]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,1,2,4,9]\n9\n
# @lcpr case=end

#
