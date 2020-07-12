#
# @lc app=leetcode id=77 lang=ruby
#
# [77] Combinations
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  result  = []

  dfs((1..n).to_a, 1, k, [], result)

  result
end

def dfs(nums, level, k, path, result)
  return result << path if level > k

  nums.each_with_index do |num, i|
    new_path = path.dup << num
    dfs(nums[i+1..-1], level+1, k, new_path, result)
  end
end
# @lc code=end

