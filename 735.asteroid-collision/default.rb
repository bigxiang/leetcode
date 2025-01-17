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
  asteroids.each do |a|
    stack.pop while stack.any? && stack.last > 0 && stack.last < -a
    stack.pop && next if stack.any? && stack.last > 0 && stack.last == -a

    stack.push(a) if stack.empty? || a > 0 || stack.last < 0
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
# [10,2,-5,7,-7,6,-3,13,-14]\n
# @lcpr case=end

# @lcpr case=start
# [-2,-1,1,2]\n
# @lcpr case=end

#
