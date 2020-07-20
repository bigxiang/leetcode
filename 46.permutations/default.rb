#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  dfs(nums, [])
end

def dfs(nums, selected_nums, result = [])
  return result << selected_nums if nums.empty?

  nums.each_with_index do |n, i|
    new_selected_nums = selected_nums.dup << n
    new_nums = nums.dup.tap { |a| a.delete_at(i) }

    dfs(new_nums, new_selected_nums, result)
  end

  result
end
# @lc code=end

