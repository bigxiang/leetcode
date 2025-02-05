#
# @lc app=leetcode.cn id=922 lang=ruby
# @lcpr version=30204
#
# [922] 按奇偶排序数组 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity_ii(nums)
  j = 1
  (0...nums.length).step(2).each do |i|
    while nums[i].odd?
      nums[i], nums[j] = nums[j], nums[i]
      j += 2
    end
  end
  nums
end
# @lc code=end

#
# @lcpr case=start
# [4,2,5,7]\n
# @lcpr case=end

# @lcpr case=start
# [2,3]\n
# @lcpr case=end

# @lcpr case=start
# [2,3,6,5,1,7,4,8]\n
# @lcpr case=end

#
