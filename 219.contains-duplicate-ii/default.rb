#
# @lc app=leetcode.cn id=219 lang=ruby
# @lcpr version=30204
#
# [219] 存在重复元素 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  return false if k.zero?

  set = Set.new
  (0..[k, nums.size - 1].min).each do |i|
    return true if set.include?(nums[i])

    set.add(nums[i])
  end
  (k + 1...nums.size).each do |i|
    set.delete(nums[i - k - 1])
    return true if set.include?(nums[i])

    set.add(nums[i])
  end
  false
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,1]\n3\n
# @lcpr case=end

# @lcpr case=start
# [1,0,1,1]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,0,1,1]\n0\n
# @lcpr case=end

# @lcpr case=start
# [1,0,1,1]\n100\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,1,2,3]\n2\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,1,2,3]\n3\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10]\n15\n
# @lcpr case=end
#
