#
# @lc app=leetcode.cn id=227 lang=ruby
# @lcpr version=30204
#
# [227] 基本计算器 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def calculate(s)
  stack = []
  num = 0
  operators = ['+', '-', '*', '/']
  s.each_char do |c|
    next if c == ' '

    unless operators.include?(c)
      num = num * 10 + c.to_i
      next
    end

    if ['*', '/'].include?(c)
      if stack.last == '*' || stack.last == '/'
        op = stack.pop
        prev = stack.pop
        num = op == '*' ? prev * num : prev / num
      end
    else # +, -
      while stack.any?
        op = stack.pop
        prev = stack.pop

        case op
        when '+'
          num = prev + num
        when '-'
          num = prev - num
        when '*'
          num = prev * num
        when '/'
          num = prev / num
        end
      end
    end

    stack.push(num)
    num = 0
    stack.push(c)
  end

  while stack.any?
    op = stack.pop
    prev = stack.pop

    case op
    when '+'
      num = prev + num
    when '-'
      num = prev - num
    when '*'
      num = prev * num
    when '/'
      num = prev / num
    end
  end
  num
end
# @lc code=end

#
# @lcpr case=start
# "3+2*2"\n
# @lcpr case=end

# @lcpr case=start
# " 3/2 "\n
# @lcpr case=end

# @lcpr case=start
# " 3+5 / 2 "\n
# @lcpr case=end

# @lcpr case=start
# " 3+5 / 2 - 10 + 2*8/4 -3/2+5 "\n
# @lcpr case=end

#
