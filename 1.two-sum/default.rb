#
# @lc app=leetcode.cn id=1 lang=ruby
# @lcpr version=30204
#
# [1] 两数之和
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  checked = {}
  nums.each_with_index do |n, i|
    return [checked[target - n], i] if checked.key?(target - n)

    checked[n] = i
  end
end
# @lc code=end

#
# @lcpr case=start
# [2,7,11,15]\n9\n
# @lcpr case=end

# @lcpr case=start
# [3,2,4]\n6\n
# @lcpr case=end

# @lcpr case=start
# [3,3]\n6\n
# @lcpr case=end

#
