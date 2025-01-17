#
# @lc app=leetcode.cn id=150 lang=ruby
# @lcpr version=30204
#
# [150] 逆波兰表达式求值
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  operators = ['+', '-', '*', '/']
  tokens.each do |t|
    stack.push(t.to_i) && next unless operators.include?(t)

    op2 = stack.pop
    op1 = stack.pop

    case t
    when '+'
      stack.push(op1 + op2)
    when '-'
      stack.push(op1 - op2)
    when '*'
      stack.push(op1 * op2)
    when '/'
      sign = op1 * op2 < 0 ? -1 : 1
      stack.push(op1.abs / op2.abs * sign)
    else
      raise 'wtf'
    end
  end
  stack.pop
end
# @lc code=end

#
# @lcpr case=start
# ["2","1","+","3","*"]\n
# @lcpr case=end

# @lcpr case=start
# ["4","13","5","/","+"]\n
# @lcpr case=end

# @lcpr case=start
# ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]\n
# @lcpr case=end

#
