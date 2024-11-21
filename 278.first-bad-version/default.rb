#
# @lc app=leetcode.cn id=278 lang=ruby
# @lcpr version=30204
#
# [278] 第一个错误的版本
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  left = 1
  right = n
  while left <= right
    mid = (right - left) / 2 + left
    if is_bad_version(mid)
      right = mid - 1
    else
      left = mid + 1
    end
  end
  left
end
# @lc code=end

#
# @lcpr case=start
# 5\n4\n
# @lcpr case=end

# @lcpr case=start
# 1\n1\n
# @lcpr case=end

#
