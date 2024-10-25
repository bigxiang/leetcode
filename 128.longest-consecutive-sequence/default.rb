#
# @lc app=leetcode.cn id=128 lang=ruby
# @lcpr version=30204
#
# [128] 最长连续序列
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  nums_set = nums.to_set
  result = 0

  nums_set.each do |num|
    next if nums_set.include?(num - 1)

    count = 1
    count += 1 while nums_set.include?(num + count)
    result = [result, count].max
  end

  result
end
# @lc code=end

#
# @lcpr case=start
# [100,4,200,1,3,2]\n
# @lcpr case=end

# @lcpr case=start
# [0,3,7,2,5,8,4,6,0,1]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# [0,3,7,2,5,8,4,6,0,1,11,32,15,22,21,33,36,10,19,17,24,22,22,26,28,19,31,32,24,34]\n
# @lcpr case=end

#
