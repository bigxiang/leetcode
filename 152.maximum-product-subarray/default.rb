#
# @lc app=leetcode id=152 lang=ruby
#
# [152] Maximum Product Subarray
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return 0 if nums.nil? || nums.empty?

  current_max = 1
  current_min = 1
  max = -Float::INFINITY

  nums.each do |n|
    current_min, current_max = current_max, current_min if n < 0

    current_max = [current_max * n, n].max
    current_min = [current_min * n, n].min
    max = [max, current_max].max
  end

  max
end
# @lc code=end

puts max_product([2,3,-2,4])
puts max_product([2,-3,-2,4])
puts max_product([-2,0,-1])
puts max_product([-2])
puts max_product([3,-1,4])
