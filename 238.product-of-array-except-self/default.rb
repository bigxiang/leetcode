#
# @lc app=leetcode id=238 lang=ruby
#
# [238] Product of Array Except Self
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  prefix_products = []
  suffix_products = []

  prefix_products[0] = 1
  (1...nums.size).each do |i|
    prefix_products[i] = prefix_products[i-1] * nums[i-1]
  end

  suffix_products[nums.size-1] = 1
  (nums.size-2).downto(0) do |i|
    suffix_products[i] = suffix_products[i+1] * nums[i+1]
  end

  (0...nums.size).map do |i|
    prefix_products[i] * suffix_products[i]
  end
end
# @lc code=end

