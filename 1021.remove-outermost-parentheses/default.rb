#
# @lc app=leetcode id=1021 lang=ruby
#
# [1021] Remove Outermost Parentheses
#

# @lc code=start
# @param {String} s
# @return {String
def remove_outer_parentheses(s)
  parentheses_stack = []
  result = ''
  s.chars.each do |c|
    if parentheses_stack.empty?
      parentheses_stack.push(c)
    else
      if c == '('
        parentheses_stack.push(c)
        result << c
      else
        parentheses_stack.pop
        result << c if parentheses_stack.any?
      end
    end
  end

  result
end
# @lc code=end
