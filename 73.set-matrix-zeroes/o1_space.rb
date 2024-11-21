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
  zero_col0 = false
  (0..matrix.size - 1).each do |i|
    zero_col0 = true if matrix[i][0].zero?

    (1..matrix[0].size - 1).each do |j|
      if matrix[i][j].zero?
        matrix[i][0] = 0
        matrix[0][j] = 0
      end
    end
  end

  (matrix.size - 1).downto(0) do |i|
    (1..matrix[0].size - 1).each do |j|
      matrix[i][j] = 0 if matrix[i][0].zero? || matrix[0][j].zero?
    end
    matrix[i][0] = 0 if zero_col0
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
