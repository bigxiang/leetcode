#
# @lc app=leetcode id=329 lang=ruby
#
# [329] Longest Increasing Path in a Matrix
#

# @lc code=start
# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  return 0 if matrix.empty? || matrix[0].empty?

  memo = Array.new(matrix.size) { Array.new(matrix[0].size, 0) }
  longest_path = 0

  matrix.each_index do |i|
    matrix[i].each_index do |j|
      longest_path_for_cell = solve_longest_path(matrix, i, j, memo)
      longest_path = longest_path_for_cell > longest_path ? longest_path_for_cell : longest_path
    end
  end

  longest_path
end

def solve_longest_path(matrix, i, j, memo)
  return memo[i][j] if memo[i][j] > 0

  path_from_above = if i > 0 && matrix[i][j] < matrix[i-1][j]
    1 + solve_longest_path(matrix, i-1, j, memo)
  else
    1
  end

  path_from_left = if j > 0 && matrix[i][j] < matrix[i][j-1]
    1 + solve_longest_path(matrix, i, j-1, memo)
  else
    1
  end

  path_from_below = if i < matrix.size-1 && matrix[i][j] < matrix[i+1][j]
    1 + solve_longest_path(matrix, i+1, j, memo)
  else
    1
  end

  path_from_right = if j < matrix[0].size-1 && matrix[i][j] < matrix[i][j+1]
    1 + solve_longest_path(matrix, i, j+1, memo)
  else
    1
  end

  result = [path_from_above, path_from_left, path_from_below, path_from_right].max
  memo[i][j] = result
  result
end
# @lc code=end

# puts longest_increasing_path(
#   [
#     [0,1,2,3,4,5,6,7,8,9],
#     [19,18,17,16,15,14,13,12,11,10],
#     [20,21,22,23,24,25,26,27,28,29],
#     [39,38,37,36,35,34,33,32,31,30],
#     [40,41,42,43,44,45,46,47,48,49],
#     [59,58,57,56,55,54,53,52,51,50],
#     [60,61,62,63,64,65,66,67,68,69],
#     [79,78,77,76,75,74,73,72,71,70],
#     [80,81,82,83,84,85,86,87,88,89],
#     [99,98,97,96,95,94,93,92,91,90],
#     [100,101,102,103,104,105,106,107,108,109],
#     [119,118,117,116,115,114,113,112,111,110],
#     [120,121,122,123,124,125,126,127,128,129],
#     [139,138,137,136,135,134,133,132,131,130],
#     [0,0,0,0,0,0,0,0,0,0]
#   ]
# )
