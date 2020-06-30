#
# @lc app=leetcode id=1021 lang=ruby
#
# [1021] Remove Outermost Parentheses
#

# @lc code=start
# @param {String} s
# @return {String
def remove_outer_parentheses(s)
  level = 0
  result = []
  outermost_parentheses_index = 0

  s.chars.each_with_index do |c, i|
    c == '(' ? level += 1 : level -= 1

    if level.zero?
      result << s[outermost_parentheses_index+1..i-1]
      outermost_parentheses_index = i+1
    end
  end

  result.join
end
# @lc code=end
