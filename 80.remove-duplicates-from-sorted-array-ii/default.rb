#
# @lc app=leetcode.cn id=80 lang=ruby
# @lcpr version=30204
#
# [80] 删除有序数组中的重复项 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return nums.size if nums.size < 3

  no_dup_idx = 2
  i = 2
  (i..nums.size - 1).each do |i|
    if nums[i] != nums[no_dup_idx - 2]
      nums[no_dup_idx] = nums[i]
      no_dup_idx += 1
    end
  end
  no_dup_idx
end
# @lc code=end

#
# @lcpr case=start
# [1,1,1,2,2,3]\n
# @lcpr case=end

# @lcpr case=start
# [0,0,1,1,1,1,2,3,3]\n
# @lcpr case=end

#
