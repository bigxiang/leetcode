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
  checked = {}

  nums.each_with_index do |n, i|
    return [checked[target-n], i] if checked.key?(target-n)

    checked[n] = i
  end
end
# @lc code=end

