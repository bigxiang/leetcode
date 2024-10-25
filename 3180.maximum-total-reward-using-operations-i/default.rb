#
# @lc app=leetcode.cn id=3180 lang=ruby
# @lcpr version=30204
#
# [3180] 执行操作可获得的最大总奖励 I
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} reward_values
# @return {Integer}
def max_total_reward(reward_values)
  reward_values = reward_values.sort.uniq

  [dfs(reward_values, 0, 0), dfs(reward_values, 1, 0)].max
end

def dfs(reward_values, i, reward)
  return reward if i == reward_values.size || reward >= reward_values[-1]

  if reward_values[i] > reward
    [dfs(reward_values, i + 1, reward + reward_values[i]), dfs(reward_values, i + 1, reward)].max
  else
    dfs(reward_values, i + 1, reward)
  end
end
# @lc code=end

#
# @lcpr case=start
# [1,1,3,3]\n
# @lcpr case=end

# @lcpr case=start
# [1,6,4,3,2]\n
# @lcpr case=end

# @lcpr case=start
# [29,310,251,206,212,62,139,393,187,352,94,291,74,119,219,87,368,433,445,456,271,246,475,146,2,212,478,71,195,291,95,477,372,88,343,141,402,362,300,43,143,254,141,326,84,425,469,212,461,126,485,205,433,355,241,370,385,133,105,477,91,317,199,405,500,125,142,45,198,98,38,264,459,3,483,209,274,431,311,107,354,49,383,282,266,380,171,21,486,500,405,161,29,141,277,446,435,366,442,75]\n
# @lcpr case=end

# @lcpr case=start
# [29,310,251,206,212,62,139,393,187,352,94,291,74,119,219,87,368,433,445,456,271,246,475,146,2,212,478,71,195,291,95,477,372,88,343,141,402,362,300,43,143,254,141,326,84,425,469,212,461,126,485,205,433,355,241,370,385,133,105,477,91,317,199,405,500,125,142,45,198,98,38,264,459,3,483,209,274,431,311,107,354,49,383,282,266,380,171,21,486,500,405,161,29,141,277,446,435,366,442,75,1000,999,998,997,996,995,994,993,992,991,990,989,987,986,985,980,976,974,972,970,967]\n
# @lcpr case=end
#
