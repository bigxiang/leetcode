#
# @lc app=leetcode.cn id=704 lang=ruby
# @lcpr version=30204
#
# [704] 二分查找
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.size - 1
  while left <= right
    mid = (right - left) / 2 + left
    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end
# @lc code=end

#
# @lcpr case=start
# [-1,0,3,5,9,12]\n9\n
# @lcpr case=end

# @lcpr case=start
# [-1,0,3,5,9,12]\n2\n
# @lcpr case=end

#
