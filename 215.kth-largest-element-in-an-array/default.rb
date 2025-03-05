#
# @lc app=leetcode id=215 lang=ruby
#
# [215] Kth Largest Element in an Array
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  nums.sort[-k]
end
# @lc code=end

# @lcpr case=start
# [3,2,1,5,6,4]\n2\n
# @lcpr case=end

# @lcpr case=start
# [3,2,3,1,2,4,5,5,6]\n4\n
# @lcpr case=end

# @lcpr case=start
# [3]\n1\n
# @lcpr case=end

# @lcpr case=start
# [3,2,4]\n1\n
# @lcpr case=end


# @lcpr case=start
# [1,2,3,4,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]\n1\n
# @lcpr case=end
