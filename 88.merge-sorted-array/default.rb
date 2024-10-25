#
# @lc app=leetcode.cn id=88 lang=ruby
# @lcpr version=30204
#
# [88] 合并两个有序数组
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  return if n.zero?

  i = 0
  j = 0
  while i < m + n && j < n
    if i < m + j
      if nums1[i] > nums2[j]
        move_elements(nums1, i, m + j - 1)
        nums1[i] = nums2[j]
        j += 1
      else
        i += 1
      end
    else
      nums1[i] = nums2[j]
      j += 1
    end
  end
end

def move_elements(nums1, start_index, end_index)
  i = end_index
  while i >= start_index
    nums1[i + 1] = nums1[i]
    i -= 1
  end
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,0,0,0]\n3\n[2,5,6]\n3\n
# @lcpr case=end

# @lcpr case=start
# [1]\n1\n[]\n0\n
# @lcpr case=end

# @lcpr case=start
# [0]\n0\n[1]\n1\n
# @lcpr case=end

#
nums1 = [0]
m = 0
nums2 = [1]
n = 1
merge(nums1, m, nums2, n)
puts nums1

nums1 = [1]
m = 1
nums2 = []
n = 0
merge(nums1, m, nums2, n)
puts nums1

nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3
merge(nums1, m, nums2, n)
puts nums1

nums1 = [-3, -2, -1, 0, 0, 0]
m = 3
nums2 = [0, 0, 0]
n = 3
merge(nums1, m, nums2, n)
puts nums1
