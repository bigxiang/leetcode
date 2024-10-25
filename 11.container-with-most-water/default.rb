#
# @lc app=leetcode.cn id=11 lang=ruby
# @lcpr version=30204
#
# [11] 盛最多水的容器
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left = 0
  right = height.size - 1
  water = 0
  while left < right
    water = [water, (right - left) * [height[left], height[right]].min].max
    height[left] < height[right] ? left += 1 : right -= 1
  end
  water
end
# @lc code=end

#
# @lcpr case=start
# [1,8,6,2,5,4,8,3,7]\n
# @lcpr case=end

# @lcpr case=start
# [1,1]\n
# @lcpr case=end

#
