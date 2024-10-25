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
  root = LinkedNode.new(skills[0], 0)
  node = root
  max_node = root
  (1...skills.size).each do |i|
    new_node = LinkedNode.new(skills[i], i)
    max_node = new_node if new_node.val > max_node.val
    node.next_node = new_node
    node = new_node
  end
  tail = node

  return max_node.index if k >= skills.size - 1

  wins = 0
  node = root
  loop do
    if node.val > node.next_node.val
      wins += 1
      new_tail = node.next_node
      node.next_node = node.next_node.next_node
    else
      wins = 1

      new_tail = node
      node = node.next_node
    end

    tail.next_node = new_tail
    new_tail.next_node = nil
    tail = new_tail

    return node.index if wins == k
  end
end

class LinkedNode
  attr_accessor :val, :index, :next_node

  def initialize(val, index, next_node = nil)
    @val = val
    @index = index
    @next_node = next_node
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
