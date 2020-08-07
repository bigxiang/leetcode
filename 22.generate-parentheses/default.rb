#
# @lc app=leetcode id=22 lang=ruby
#
# [22] Generate Parentheses
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  dfs('(', 2 * n)
end

def dfs(current, max)
  return is_valid?(current) ? [current] : [] if current.length == max

  dfs(current + '(', max) + dfs(current + ')', max)
end

def is_valid?(s)
  stack = []
  s.chars.each do |c|
    if c == '('
      stack.push(c)
    elsif stack.pop != '('
      return false
    end
  end
  stack.empty?
end
# @lc code=end

puts generate_parenthesis(3)
