#
# @lc app=leetcode.cn id=27 lang=ruby
# @lcpr version=30204
#
# [27] 移除元素
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  i = 0
  j = nums.size - 1
  while i < j
    if nums[i] == val
      nums[i] = nums[j]
      j -= 1
    else
      i += 1
    end
  end
  i
end
# @lc code=end

#
# @lcpr case=start
# [3,2,2,3]\n3\n
# @lcpr case=end

# @lcpr case=start
# [0,1,2,2,3,0,4,2]\n2\n
# @lcpr case=end

#
