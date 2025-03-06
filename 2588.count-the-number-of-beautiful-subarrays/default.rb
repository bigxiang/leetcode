#
# @lc app=leetcode.cn id=2588 lang=ruby
# @lcpr version=30204
#
# [2588] 统计美丽子数组数目
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def beautiful_subarrays(nums)
  prefix_count = Hash.new(0)
  prefix_count[0] = 1
  _, count = nums.reduce([0, 0]) do |(prefix, count), num|
    prefix ^= num
    count += prefix_count[prefix]
    prefix_count[prefix] += 1

    [prefix, count]
  end

  count
end
# @lc code=end



#
# @lcpr case=start
# [4,3,1,2,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,10,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,10,4,2,3,1,7,9,4,6,8,19,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [1,10,4,2,0,3,1,0,7,9,4,6,8,19,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [0]\n
# @lcpr case=end

# @lcpr case=start
# [0,0,0,0]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

#

