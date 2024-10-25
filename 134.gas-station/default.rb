#
# @lc app=leetcode.cn id=134 lang=ruby
# @lcpr version=30204
#
# [134] 加油站
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  remaining_gas = 0
  start_index = 0
  i = 0
  visited = {}
  while i - start_index < gas.size
    if remaining_gas <= 0 && gas[i % gas.size] - cost[i % gas.size] >= 0
      start_index = i % gas.size
      return -1 if visited[start_index]

      visited[start_index] = true
      remaining_gas = 0
    end
    remaining_gas += gas[i % gas.size] - cost[i % gas.size]
    i += 1
  end
  remaining_gas >= 0 ? start_index : -1
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n[3,4,5,1,2]\n
# @lcpr case=end

# @lcpr case=start
# [2,3,4]\n[3,4,3]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n[2]\n
# @lcpr case=end

# @lcpr case=start
# [2]\n[1]\n
# @lcpr case=end

#
