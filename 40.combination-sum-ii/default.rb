#
# @lc app=leetcode.cn id=40 lang=ruby
# @lcpr version=30204
#
# [40] 组合总和 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  nums_count = candidates.each_with_object({}) do |c, h|
    h[c] ||= 0
    h[c] += 1
  end

  result = []
  dfs(nums_count, nums_count.keys, 0, 0, target, [], result)
  result
end

def dfs(nums_count, nums, i, used_times, target, seq, result)
  return if i == nums.size
  return if target < 0
  return if used_times > nums_count[nums[i]]

  if target == 0
    result.push(seq)
    return
  end

  dfs(nums_count, nums, i, used_times + 1, target - nums[i], seq + [nums[i]], result)
  dfs(nums_count, nums, i + 1, 0, target, seq, result)
end
# @lc code=end

#
# @lcpr case=start
# [10,1,2,7,6,1,5]\n8\n
# @lcpr case=end

# @lcpr case=start
# [2,5,2,1,2]\n5\n
# @lcpr case=end

#
