#
# @lc app=leetcode.cn id=39 lang=ruby
# @lcpr version=30204
#
# [39] 组合总和
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  result = []
  dfs(candidates, target, 0, [], result)
  result
end

def dfs(candidates, target, i, combination = [], result = [])
  return if target < 0

  if target == 0
    result << combination
    return
  end

  dfs(candidates, target - candidates[i], i, combination + [candidates[i]], result)
  dfs(candidates, target, i + 1, combination.dup, result) if i < candidates.size - 1
end
# @lc code=end

#
# @lcpr case=start
# [2,3,6,7]\n7\n
# @lcpr case=end

# @lcpr case=start
# [2,3,5]\n8\n
# @lcpr case=end

# @lcpr case=start
# [2]\n1\n
# @lcpr case=end

# @lcpr case=start
# [5,4,6,17,2,10,15,18,24,40,32,30,19,7]\n26\n
# @lcpr case=end

#
