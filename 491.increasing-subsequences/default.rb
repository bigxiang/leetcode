#
# @lc app=leetcode id=491 lang=ruby
#
# [491] Increasing Subsequences
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
  result = []
  build_sequence(nums, 0, [], result)
  result
end

def build_sequence(nums, i, path, result)
  result << path.dup if path.size > 1

  visited = Set.new
  (i...nums.size).each do |j|
    next if !path.empty? && nums[j] < path[-1]
    next if visited.include?(nums[j])

    path << nums[j]
    visited << nums[j]
    build_sequence(nums, j+1, path, result)
    path.pop
  end
end
# @lc code=end

