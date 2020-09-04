#
# @lc app=leetcode id=394 lang=ruby
#
# [394] Decode String
#

# @lc code=start
# @param {String} s
# @return {String}
def decode_string(s)
  curr = ''
  str_stack = []
  num_stack = []
  repeat = 0

  s.chars.each do |c|
    case c
    when '['
      num_stack << repeat
      repeat = 0

      str_stack << curr
      curr = ''
    when ']'
      curr = str_stack.pop + curr * num_stack.pop
    when ('0'..'9')
      repeat = repeat * 10 + c.to_i
    else
      curr << c
    end
  end

  curr
end
# @lc code=end

s = "3[a]2[bc]"
puts decode_string(s)

s = "3[a2[c]]"
puts decode_string(s)

s= "3[a10[bc]]"
puts decode_string(s)

s = "2[abc]3[cd]ef"
puts decode_string(s)

s = "abc3[cd]xyz"
puts decode_string(s)

s = "100[leetcode]"
puts decode_string(s)
