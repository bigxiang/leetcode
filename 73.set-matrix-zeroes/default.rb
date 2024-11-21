#
# @lc app=leetcode.cn id=73 lang=ruby
# @lcpr version=30204
#
# [73] 矩阵置零
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  updated = Array.new(matrix.size) { Array.new(matrix[0].size, false) }

  (0..matrix.size - 1).each do |i|
    (0..matrix[0].size - 1).each do |j|
      if matrix[i][j].zero? && !updated[i][j]
        (0..matrix.size - 1).each { |k| updated[k][j] = true && matrix[k][j] = 0 if matrix[k][j] != 0 }
        (0..matrix[0].size - 1).each { |k| updated[i][k] = true && matrix[i][k] = 0 if matrix[i][k] != 0 }
      end
    end
  end
end
# @lc code=end

#
# @lcpr case=start
# [[1,1,1],[1,0,1],[1,1,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,1,2,0],[3,4,5,2],[1,3,1,5]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,1,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0,0]]\n
# @lcpr case=end

#
