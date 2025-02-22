#
# @lc app=leetcode.cn id=217 lang=ruby
# @lcpr version=30204
#
# [217] 存在重复元素
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  existing = {}
  nums.each do |num|
    return true if existing.key?(num)

    existing[num] = true
  end
  false
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,1,1,3,3,4,3,2,4,2]\n
# @lcpr case=end

#
