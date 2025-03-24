#
# @lc app=leetcode.cn id=2116 lang=ruby
# @lcpr version=30204
#
# [2116] 判断一个括号字符串是否有效
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @param {String} locked
# @return {Boolean}
def can_be_valid(s, locked)
  return false if s.length % 2 == 1

  left_count = 0
  right_count = 0

  (0...s.length).each do |i|
    if s[i] == ')' && locked[i] == '1'
      right_count += 1
    else
      left_count += 1
    end
    return false if right_count > left_count
  end

  left_count = 0
  right_count = 0

  (s.length - 1).downto(0) do |i|
    if s[i] == '(' && locked[i] == '1'
      left_count += 1
    else
      right_count += 1
    end
    return false if left_count > right_count
  end

  true
end
# @lc code=end



#
# @lcpr case=start
# "))()))"\n"010100"\n
# @lcpr case=end

# @lcpr case=start
# "()()"\n"0000"\n
# @lcpr case=end

# @lcpr case=start
# ")"\n"0"\n
# @lcpr case=end

# @lcpr case=start
# "(((())(((())"\n"111111010111"\n
# @lcpr case=end

#

