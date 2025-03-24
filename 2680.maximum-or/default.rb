#
# @lc app=leetcode.cn id=2680 lang=ruby
# @lcpr version=30204
#
# [2680] 最大或值
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_or(nums, k)
  or_sum = 0
  multi_bits = 0
  nums.each do |num|
    multi_bits |= num & or_sum
    or_sum |= num
  end

  result = 0
  nums.each do |num|
    result = [result, (or_sum ^ num) | multi_bits | (num << k)].max
  end
  result
end
# @lc code=end



#
# @lcpr case=start
# [12,9]\n1\n
# @lcpr case=end

# @lcpr case=start
# [12,9]\n2\n
# @lcpr case=end

# @lcpr case=start
# [12,9]\n3\n
# @lcpr case=end

# @lcpr case=start
# [12,9]\n4\n
# @lcpr case=end

# @lcpr case=start
# [8,1,2]\n2\n
# @lcpr case=end

# @lcpr case=start
# [8,9,10,11,17]\n2\n
# @lcpr case=end

# @lcpr case=start
# [41,79,82,27,71,62,57,67,34,8,71,2,12,93,52,91,86,81,1,79,64,43,32,94,42,91,9,25]\n3\n
# @lcpr case=end

# @lcpr case=start
# [4,100,76,37,99,79,39]\n4\n
# @lcpr case=end
#

