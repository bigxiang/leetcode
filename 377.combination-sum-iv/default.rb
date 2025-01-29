#
# @lc app=leetcode.cn id=377 lang=ruby
# @lcpr version=30204
#
# [377] 组合总和 Ⅳ
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
  dp = Array.new(target + 1, 0)
  dp[0] = 1
  (1..target).each do |i|
    nums.each do |n|
      dp[i] += dp[i - n] if i >= n
    end
  end
  dp.last
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3]\n4\n
# @lcpr case=end

# @lcpr case=start
# [9]\n3\n
# @lcpr case=end

#
