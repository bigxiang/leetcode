#
# @lc app=leetcode id=26 lang=ruby
#
# [26] Remove Duplicates from Sorted Array
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  no_dup_idx = 1
  (1..nums.size-1).each do |i|
    if nums[i] != nums[no_dup_idx-1]
      nums[no_dup_idx] = nums[i]
      no_dup_idx += 1
    end
  end
  no_dup_idx
end
# @lc code=end

nums = [0,0,1,1,1,2,2,3,3,4]
puts nums[0, remove_duplicates(nums)]

nums = []
puts nums[0, remove_duplicates(nums)]
