#
# @lc app=leetcode id=1122 lang=ruby
#
# [1122] Relative Sort Array
#

# @lc code=start
# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  arr2_idx_map = arr2.each_with_index.each_with_object({}) { |(n, i), memo| memo[n] = i }
  arr1.sort_by { |n| arr2_idx_map[n] || 1000 + n }
end
# @lc code=end

