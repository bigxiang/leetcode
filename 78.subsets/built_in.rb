#
# @lc app=leetcode id=78 lang=ruby
#
# [78] Subsets
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = []
  (nums.size+1).times do |i|
    nums.combination(i).each do |combination|
      result << combination
    end
  end
  result
end
# @lc code=end

