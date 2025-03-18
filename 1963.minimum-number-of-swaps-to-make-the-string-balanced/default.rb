#
# @lc app=leetcode.cn id=1963 lang=ruby
# @lcpr version=30204
#
# [1963] 使字符串平衡的最小交换次数
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def min_swaps(s)
  count = 0
  left = 0
  right = s.length - 1
  left_stack = []
  right_stack = []
  while left < right
    if s[left] == '['
      left_stack.push(s[left])
      left += 1
      next
    end

    if s[left] == ']' && left_stack.last == '['
      left_stack.pop
      left += 1
      next
    end

    if s[right] == ']'
      right_stack.push(s[right])
      right -= 1
      next
    end

    if s[right] == '[' && right_stack.last == ']'
      right_stack.pop
      right -= 1
      next
    end

    s[left], s[right] = s[right], s[left]
    count += 1
  end

  count
end
# @lc code=end



#
# @lcpr case=start
# "][]["\n
# @lcpr case=end

# @lcpr case=start
# "]]][[["\n
# @lcpr case=end

# @lcpr case=start
# "[]"\n
# @lcpr case=end

# @lcpr case=start
# "[]][[[]]]]][[[[]]]]]]]]][[[[[[[["\n
# @lcpr case=end
#

