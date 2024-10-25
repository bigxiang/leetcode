#
# @lc app=leetcode.cn id=3175 lang=ruby
# @lcpr version=30204
#
# [3175] 找到连续赢 K 场比赛的第一位玩家
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} skills
# @param {Integer} k
# @return {Integer}
def find_winning_player(skills, k)
  i = 0
  wins = 0
  while i < skills.size
    j = i + 1
    return i if wins == k || j == skills.size

    while skills[j] < skills[i]
      wins += 1
      j += 1

      return i if wins == k || j == skills.size
    end

    i = j
    wins = 1
  end
end

# @lc code=end

#
# @lcpr case=start
# [4,2,6,3,9]\n2\n
# @lcpr case=end

#
# @lcpr case=start
# [4,2,6,3,9]\n4\n
# @lcpr case=end

# @lcpr case=start
# [2,5,4]\n3\n
# @lcpr case=end

# @lcpr case=start
# [2,5,4]\n1\n
# @lcpr case=end

#
# @lcpr case=start
# [4,18,17,20]\n1\n
# @lcpr case=end

#
# @lcpr case=start
# [4,18,17,20,15,12,8,5]\n1\n
# @lcpr case=end

#
