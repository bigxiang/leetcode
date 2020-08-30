#
# @lc app=leetcode id=238 lang=ruby
#
# [238] Product of Array Except Self
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  result = (1...nums.size).reduce([1]) do |memo, i|
    memo[i] = memo[i-1] * nums[i-1]
    memo
  end

  suffix_product = 1
  (nums.size-2).downto(0) do |i|
    suffix_product *= nums[i+1]
    result[i] *= suffix_product
  end

  result
end
# @lc code=end

