#
# @lc app=leetcode id=22 lang=ruby
#
# [22] Generate Parentheses
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  dfs('(', 1, 0, n)
end

def dfs(current, left_count, right_count, n)
  return [current] if left_count == n && right_count == n

  result = []
  result += dfs(current + '(', left_count + 1, right_count, n) if left_count < n
  result += dfs(current + ')', left_count, right_count + 1, n) if right_count < left_count
  result
end
# @lc code=end

puts generate_parenthesis(3)
