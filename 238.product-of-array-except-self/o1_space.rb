#
# @lc app=leetcode id=238 lang=ruby
#
# [238] Product of Array Except Self
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  result = []

  result[0] = 1
  (1...nums.size).each do |i|
    result[i] = result[i-1] * nums[i-1]
  end

  suffix_products = 1
  (nums.size-2).downto(0) do |i|
    suffix_products *= nums[i+1]
    result[i] *= suffix_products
  end

  result
end
# @lc code=end

