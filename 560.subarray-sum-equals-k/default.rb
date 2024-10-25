#
# @lc app=leetcode.cn id=560 lang=ruby
# @lcpr version=30204
#
# [560] 和为 K 的子数组
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  sums_count = { 0 => 1 }
  pre = 0
  result = 0
  nums.each do |num|
    pre += num

    sums_count[pre] ||= 0
    sums_count[pre] += 1

    result += sums_count[pre - k] || 0
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# [1,1,1]\n2\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3]\n3\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,4,2,4,1,0,3,0,-5,-4,-10,3,2,9,8,1,2,3,-4,-5,0,-6,-1,2,7,5,0]\n19\n
# @lcpr case=end

# @lcpr case=start
# [3,4,7,2,-3,1,4,2]\n7\n
# @lcpr case=end

#
