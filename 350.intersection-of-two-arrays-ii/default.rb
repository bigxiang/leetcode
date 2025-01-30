#
# @lc app=leetcode.cn id=350 lang=ruby
# @lcpr version=30204
#
# [350] 两个数组的交集 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  nums1_count = nums1.each_with_object({}) do |num, hash|
    hash[num] ||= 0
    hash[num] += 1
  end
  result = []
  nums2.each do |num|
    if nums1_count.fetch(num, 0) > 0
      result.push(num)
      nums1_count[num] -= 1
    end
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# [1,2,2,1]\n[2,2]\n
# @lcpr case=end

# @lcpr case=start
# [4,9,5]\n[9,4,9,8,4]\n
# @lcpr case=end

#
