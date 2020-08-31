#
# @lc app=leetcode id=8 lang=ruby
#
# [8] String to Integer (atoi)
#

# @lc code=start
# @param {String} str
# @return {Integer}
def my_atoi(str)
  int_min = - 2 ** 31
  int_max = 2 ** 31 - 1
  num = 0
  sign = 1

  str.strip.chars.each_with_index do |c, i|
    if i.zero?
      if c == '-'
        sign = -1
        next
      elsif c == '+'
        next
      end
    end

    break if c < '0' || c > '9'

    num = num * 10 + c.to_i

    return int_max if num * sign > int_max
    return int_min if num * sign < int_min
  end

  num * sign
end
# @lc code=end

puts my_atoi('42')
puts my_atoi('     -42')
puts my_atoi('     +4223 002')
puts my_atoi('     +4223-002')
puts my_atoi('4193 with words')
puts my_atoi('words and 987')
puts my_atoi('-91283472332')

