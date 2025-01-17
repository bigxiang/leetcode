#
# @lc app=leetcode id=394 lang=ruby
#
# [394] Decode String
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {String}
def decode_string(s)
  stack = []
  str = ''
  num = 0
  s.each_char do |c|
    if c >= '0' && c <= '9'
      num = num * 10 + c.to_i
      if str.length > 0
        stack.push(str)
        str = ''
      end
    elsif c >= 'a' && c <= 'z'
      str += c
    elsif c == '['
      stack.push(num)
      num = 0
      stack.push('[')
    else # ]
      str = stack.pop + str while stack.last != '['
      stack.pop # [
      stack.push(str * stack.pop)
      str = ''
    end
  end
  stack.push(str) if str.length > 0
  stack.join
end

# @lc code=end

# @lcpr case=start
# "3[a]2[bc]"\n
# @lcpr case=end

# @lcpr case=start
# "2[abc]3[cd]ef"\n
# @lcpr case=end

# @lcpr case=start
# "abc3[cd]xyz"\n
# @lcpr case=end

# @lcpr case=start
# "abc3[cd2[de2[ff]]]xyz"\n
# @lcpr case=end
