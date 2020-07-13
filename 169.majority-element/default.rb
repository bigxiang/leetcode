#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  nums_count_map = nums.each_with_object(Hash.new(0)) { |n, h| h[n] += 1 }
  nums_count_map.select { |n, c| c > nums.size / 2 }.keys.first
end
# @lc code=end

