require 'pp'
#
# @lc app=leetcode id=410 lang=ruby
#
# [410] Split Array Largest Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} m
# @return {Integer}
def split_array(nums, m)
  dp = Array.new(nums.size+1) { Array.new(m+1, Float::INFINITY) }
  pre_sums = Array.new(nums.size+1, 0)
  nums.each_with_index do |n, i|
    pre_sums[i+1] = pre_sums[i] + n
  end

  dp[0][0] = 0
  (1..nums.size).each do |i|
    (1..m).each do |j|
      (0..i).each do |k|
        dp[i][j] = [dp[i][j], [dp[k][j-1], pre_sums[i] - pre_sums[k]].max].min
      end
    end
  end
  # pp dp
  dp[-1][-1]
end

# @lc code=end


# n = 4, [1,2,3,4]
# m = 2, split = 1, split_before_i <= n-m + split

# m = 3, split = 1, split_before_i <= n-m + split
#        split = 2, split_before_i <= n-m + split
#        split = 3, stop recursion, split_before_i = n-m + 3 = n
# puts split_array([7,2,5,10,8,8,2,5,2], 1)
puts split_array([10,5,13,4,8,4,5,11,14,9,16,10,20,28], 8)
