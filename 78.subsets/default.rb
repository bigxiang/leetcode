#
# @lc app=leetcode id=78 lang=ruby
#
# [78] Subsets
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = [[]]

  nums.size.times { |n| dfs(nums, 1, n + 1, [], result) }

  result
end

def dfs(nums, level, max_level, path, result)
  return result << path if level > max_level

  nums.each_with_index do |n, i|
    dfs(nums[i+1..-1], level + 1, max_level, (path.dup << n), result)
  end
end
# @lc code=end

