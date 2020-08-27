#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []
  dfs(nums, [], result)
  result
end

def dfs(nums, path, result)
  return result << path.dup if path.size == nums.size

  (nums - path).each do |n|
    dfs(nums, path << n, result)
    path.pop
  end
end
# @lc code=end

