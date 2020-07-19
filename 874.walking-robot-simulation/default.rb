#
# @lc app=leetcode id=874 lang=ruby
#
# [874] Walking Robot Simulation
#

# @lc code=start
# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}
def robot_sim(commands, obstacles)
  x = 0
  y = 0
  dx = 0
  dy = 1
  result = 0

  obstacles_set = obstacles.each_with_object({}) do |obstacle, memo|
    memo[obstacle] = true
  end

  commands.each do |command|
    case command
    when -2
      dx, dy = -dy, dx
    when -1
      dx, dy = dy, -dx
    else
      command.times do
        break if obstacles_set[[x + dx, y + dy]]

        x += dx
        y += dy

        distance = x ** 2 + y ** 2
        result = result > distance ? result : distance
      end
    end
  end

  result
end
# @lc code=end

