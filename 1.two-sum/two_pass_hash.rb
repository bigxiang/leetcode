#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  num_index_map =
    nums.each_with_index.each_with_object({}) do |(n, i), memo|
      memo[n] = i
    end

  nums.each_with_index do |n, i|
    return [i, num_index_map[target-n]] if num_index_map.key?(target-n) && i!=num_index_map[target-n]
  end
end
# @lc code=end

