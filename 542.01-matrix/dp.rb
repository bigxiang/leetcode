#
# @lc app=leetcode.cn id=542 lang=ruby
# @lcpr version=30204
#
# [542] 01 矩阵
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(mat)
  m = mat.size
  n = mat[0].size
  distances = Array.new(m) { Array.new(n, 10**10) }

  (0...m).each do |i|
    (0...n).each do |j|
      distances[i][j] = 0 if mat[i][j].zero?
    end
  end

  (0...m).each do |i|
    (0...n).each do |j|
      distances[i][j] = [distances[i][j], distances[i - 1][j] + 1].min if i.positive?
      distances[i][j] = [distances[i][j], distances[i][j - 1] + 1].min if j.positive?
    end
  end

  (0...m).reverse_each do |i|
    (0...n).reverse_each do |j|
      distances[i][j] = [distances[i][j], distances[i + 1][j] + 1].min if i < m - 1
      distances[i][j] = [distances[i][j], distances[i][j + 1] + 1].min if j < n - 1
    end
  end

  distances
end
# @lc code=end

#
# @lcpr case=start
# [[0,0,0],[0,1,0],[0,0,0]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0,0],[0,1,0],[1,1,1]]\n
# @lcpr case=end

#
