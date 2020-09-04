#
# @lc app=leetcode id=394 lang=ruby
#
# [394] Decode String
#

# @lc code=start
# @param {String} s
# @return {String}
def decode_string(s)
  decode(s, 0)[0]
end

def decode(s, i)
  result = ''
  repeat = 0

  while i < s.length
    c = s[i]

    case c
    when '['
      substr, i = decode(s, i+1)
      result << substr * repeat
      repeat = 0
    when ']'
      i += 1
      break
    when ('0'..'9')
      repeat = repeat * 10 + c.to_i
      i += 1
    else
      result << c
      i += 1
    end
  end

  [result, i]
end
# @lc code=end

s = "3[a]2[bc]"
puts decode_string(s)

s = "3[a2[c]]"
puts decode_string(s)

s = "2[abc]3[cd]ef"
puts decode_string(s)

s = "abc3[cd]xyz"
puts decode_string(s)

s = "100[leetcode]"
puts decode_string(s)
