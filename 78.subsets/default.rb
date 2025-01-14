#
# @lc app=leetcode id=78 lang=ruby
#
# [78] Subsets
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = []

  (0..nums.size).each do |k|
    dfs(nums, 0, k, [], result)
  end

  result
end

def dfs(nums, i, k, path, result)
  if path.size == k
    result << path
    return
  end

  return if nums.size - i < k - path.size
  return if i == nums.size

  dfs(nums, i + 1, k, path + [nums[i]], result)
  dfs(nums, i + 1, k, path, result)
end

# @lc code=end

# @lcpr case=start
# [1,2,3]\n
# @lcpr case=end

# @lcpr case=start
# [0,1]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end
