#
# @lc app=leetcode id=47 lang=ruby
#
# [47] Permutations II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  return [[]] if nums.empty?

  result = []

  nums_map = nums.each_with_object(Hash.new(0)) { |num, memo| memo[num] += 1 }
  dfs(nums_map, 1, nums.size, [], result)

  result
end

def dfs(nums_map, level, max_level, path, result)
  return result << path if level > max_level

  path.each_with_object(nums_map.dup) { |n, memo| memo[n] -= 1 }.each do |n, count|
    next if count == 0

    dfs(nums_map, level+1, max_level, (path.dup << n), result)
  end
end
# @lc code=end

