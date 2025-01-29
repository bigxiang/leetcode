#
# @lc app=leetcode id=152 lang=ruby
#
# [152] Maximum Product Subarray
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  max = nums[0]
  i_min = nums[0]
  i_max = nums[0]
  (1...nums.size).each do |i|
    temp = [nums[i], nums[i] * i_min, nums[i] * i_max]
    i_min = temp.min
    i_max = temp.max
    max = [max, i_max].max
  end

  max
end
# @lc code=end

# @lcpr case=start
# [2,3,-2,4]\n
# @lcpr case=end

# @lcpr case=start
# [-2,0,-1]\n
# @lcpr case=end

# @lcpr case=start
# [3]\n
# @lcpr case=end

# @lcpr case=start
# [3,2,-3,2,1,4,-5,2,7,9,3,-8,-2,-3,-4,3]\n
# @lcpr case=end
