#
# @lc app=leetcode id=349 lang=ruby
#
# [349] Intersection of Two Arrays
#

# @lc code=start
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  nums1_set = nums1.each_with_object({}) do |n, memo|
    memo[n] = true
  end

  result = {}
  nums2.each do |n|
    result[n] = true if nums1_set.key?(n)
  end
  result.keys
end
# @lc code=end

