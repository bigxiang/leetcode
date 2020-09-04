#
# @lc app=leetcode id=394 lang=ruby
#
# [394] Decode String
#

# @lc code=start
# @param {String} s
# @return {String}
def decode_string(s)
  1 while s.gsub!(/(\d+)\[([a-zA-Z]*)\]/) { $2 * $1.to_i }
  s
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
