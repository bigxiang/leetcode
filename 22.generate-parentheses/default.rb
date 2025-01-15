#
# @lc app=leetcode id=22 lang=ruby
#
# [22] Generate Parentheses
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []
  dfs('(', 1, 0, n, result)
  result
end

def dfs(path, left, right, n, result)
  if left == n && right == n
    result << path
    return
  end

  dfs(path + '(', left + 1, right, n, result) if left < n
  dfs(path + ')', left, right + 1, n, result) if right < left
end

# @lc code=end

# @lcpr case=start
# 3\n
# @lcpr case=end

# @lcpr case=start
# 1\n
# @lcpr case=end
