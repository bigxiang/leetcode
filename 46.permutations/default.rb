#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [[]] if nums.size == 0

  result = []

  dfs(nums, 1, nums.size, [], result)

  result
end

def dfs(nums, level, max_level, path, result)
  return result << path if level > max_level

  nums.each do |n|
    next if path.index(n)

    new_path = path.dup << n
    dfs(nums, level+1, max_level, new_path, result)
  end
end
# @lc code=end

