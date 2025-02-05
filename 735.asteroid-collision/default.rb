#
# @lc app=leetcode.cn id=735 lang=ruby
# @lcpr version=30204
#
# [735] 小行星碰撞
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
  stack = []
  asteroids.each do |asteroid|
    stack.pop while stack.any? && stack[-1] > 0 && stack[-1] < -asteroid
    if stack.empty? || stack[-1] < 0 || asteroid > 0
      stack << asteroid
    elsif stack[-1] == -asteroid
      stack.pop
    end
  end
  stack
end
# @lc code=end

#
# @lcpr case=start
# [5,10,-5]\n
# @lcpr case=end

# @lcpr case=start
# [8,-8]\n
# @lcpr case=end

# @lcpr case=start
# [10,2,-5]\n
# @lcpr case=end

# @lcpr case=start
# [10,2,-5,7,-7,-17,6,-3,13,-15,-14]\n
# @lcpr case=end

# @lcpr case=start
# [-2,-1,1,2]\n
# @lcpr case=end

#
