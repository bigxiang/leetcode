#
# @lc app=leetcode id=45 lang=ruby
#
# [45] Jump Game II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if nums.size == 1

  dp = Array.new(nums.size) { Float::INFINITY }
  dp[-1] = 0

  (nums.size-2).downto(0) do |i|
    next if nums[i] == 0

    if nums[i] + i >= nums.size - 1
      dp[i] = 1
    else
      dp[i] = dp[i+1..i+nums[i]].min + 1
    end
  end

  dp[0]
end
# @lc code=end

