#
# @lc app=leetcode.cn id=525 lang=ruby
# @lcpr version=30204
#
# [525] 连续数组
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
  nums_map = { 0 => -1 }
  count = 0
  max_length = 0
  nums.each_with_index do |num, i|
    num == 0 ? count -= 1 : count += 1

    if nums_map.key?(count)
      max_length = [max_length, i - nums_map[count]].max
    else
      nums_map[count] = i
    end
  end
  max_length
end
# @lc code=end

#
# @lcpr case=start
# [0,1]\n
# @lcpr case=end

# @lcpr case=start
# [0,1,0]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# [0]\n
# @lcpr case=end

# @lcpr case=start
# [0,1,1,1,0,1,0,0,0,0,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,0,1,1,0,1,0]\n
# @lcpr case=end

#
