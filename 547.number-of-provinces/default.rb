#
# @lc app=leetcode.cn id=547 lang=ruby
# @lcpr version=30204
#
# [547] 省份数量
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} is_connected
# @return {Integer}
def find_circle_num(is_connected)
  visited = Set.new
  count = 0
  (0...is_connected.size).each do |i|
    next if visited.include?(i)

    queue = [i]
    while queue.any?
      city = queue.shift
      visited.add(city)

      (0...is_connected.size).each do |j|
        queue << j if is_connected[city][j] == 1 && !visited.include?(j)
      end
    end

    count += 1
  end

  count
end
# @lc code=end

#
# @lcpr case=start
# [[1,1,0],[1,1,0],[0,0,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,0,0],[0,1,0],[0,0,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]]\n
# @lcpr case=end
#
