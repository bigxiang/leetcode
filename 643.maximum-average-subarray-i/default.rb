#
# @lc app=leetcode.cn id=643 lang=ruby
# @lcpr version=30204
#
# [643] 子数组最大平均数 I
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  max_avg = -10_000
  avg = 0
  (0..nums.size - 1).each do |i|
    avg += nums[i].to_f / k

    next if i < k - 1

    max_avg = avg if avg > max_avg

    avg -= nums[i - k + 1].to_f / k
  end
  max_avg
end
# @lc code=end

#
# @lcpr case=start
# [1,12,-5,-6,50,3]\n4\n
# @lcpr case=end

# @lcpr case=start
# [5]\n1\n
# @lcpr case=end

#
