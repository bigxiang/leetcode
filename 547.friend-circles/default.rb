#
# @lc app=leetcode id=547 lang=ruby
#
# [547] Friend Circles
#

# @lc code=start
# @param {Integer[][]} m
# @return {Integer}
def find_circle_num(m)
  checked = Array.new(m.size, false)
  count = 0
  m.size.times do |i|
    count += find_friend(m, i, checked)
  end
  count
end

def find_friend(m, i, checked)
  return 0 if checked[i]

  checked[i] = true
  count = 0
  (0..m.size-1).each do |j|
    if m[i][j] == 1
      count = 1
      find_friend(m, j, checked)
    end
  end
  count
end
# @lc code=end

puts find_circle_num([[1,1,0],[1,1,0],[0,0,1]])
puts find_circle_num([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
