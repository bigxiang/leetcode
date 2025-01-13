#
# @lc app=leetcode.cn id=2270 lang=ruby
# @lcpr version=30204
#
# [2270] 分割数组的方案数
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def ways_to_split_array(nums)
  pre_sums = []
  nums.each_with_index do |num, i|
    pre_sums[i] = i == 0 ? num : (pre_sums[i - 1] + num)
  end
  suffix_sums = []
  suffix_sums[nums.size - 1] = 0
  (nums.size - 2).downto(0) do |i|
    suffix_sums[i] = suffix_sums[i + 1] + nums[i + 1]
  end
  count = 0
  (0...nums.size - 1).each do |i|
    count += 1 if pre_sums[i] >= suffix_sums[i]
  end
  count
end
# @lc code=end

#
# @lcpr case=start
# [10,4,-8,7]\n
# @lcpr case=end

# @lcpr case=start
# [2,3,1,0]\n
# @lcpr case=end

# @lcpr case=start
# [2,3]\n
# @lcpr case=end
#
