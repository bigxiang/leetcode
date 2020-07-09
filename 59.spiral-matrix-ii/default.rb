#
# @lc app=leetcode id=59 lang=ruby
#
# [59] Spiral Matrix II
#

# @lc code=start
# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = Array.new(n) { Array.new(n) }

  fill_square_border(n, 0, 1, matrix)

  matrix
end

def fill_square_border(n, level, start_number, matrix)
  return if n - 2 * level < 1

  if n - 2 * level == 1
    matrix[level][level] = start_number
    return
  end

  num = start_number
  (level..n-level-1).each do |top_i|
    matrix[level][top_i] = num
    num += 1
  end

  (level+1..n-level-1).each do |right_i|
    matrix[right_i][n-level-1] = num
    num += 1
  end

  (n-level-2).downto(level).each do |bottom_i|
    matrix[n-level-1][bottom_i] = num
    num += 1
  end

  (n-level-2).downto(level+1).each do |left_i|
    matrix[left_i][level] = num
    num += 1
  end

  fill_square_border(n, level+1, num, matrix)
end
# @lc code=end

