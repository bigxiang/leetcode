#
# @lc app=leetcode.cn id=189 lang=ruby
# @lcpr version=30204
#
# [189] 轮转数组
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k %= nums.size
  return nums if k.zero?

  temp = []
  (nums.size - k..nums.size - 1).each do |i|
    temp << nums[i]
  end
  (nums.size - k - 1).downto(0).each do |i|
    nums[i + k] = nums[i]
  end
  (0..k - 1).each do |i|
    nums[i] = temp[i]
  end
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5,6,7]\n3\n
# @lcpr case=end

# @lcpr case=start
# [-1,-100,3,99]\n2\n
# @lcpr case=end

# @lcpr case=start
# [-1]\n2\n
# @lcpr case=end
#
