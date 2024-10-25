#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  count = 0
  temp = nil
  nums.each do |n|
    temp = n if count.zero?
    count += n == temp ? 1 : -1
  end
  temp
end
# @lc code=end
