#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []
  dfs(nums, [], result)
  result
end

def dfs(nums, path, result)
  if nums.size == 0
    result << path
    return
  end

  nums.each do |n|
    dfs(nums.reject { |num| num == n }, path + [n], result)
  end
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
