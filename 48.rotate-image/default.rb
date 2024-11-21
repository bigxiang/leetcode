#
# @lc app=leetcode.cn id=48 lang=ruby
# @lcpr version=30204
#
# [48] 旋转图像
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  (0..matrix.size / 2 - 1).each do |i|
    (0..(matrix.size + 1) / 2 - 1).each do |j|
      temp = matrix[i][j]
      matrix[i][j] = matrix[matrix.size - 1 - j][i]
      matrix[matrix.size - 1 - j][i] = matrix[matrix.size - 1 - i][matrix.size - 1 - j]
      matrix[matrix.size - 1 - i][matrix.size - 1 - j] = matrix[j][matrix.size - 1 - i]
      matrix[j][matrix.size - 1 - i] = temp
    end
  end
end
# @lc code=end

#
# @lcpr case=start
# [[1,2,3],[4,5,6],[7,8,9]]\n
# @lcpr case=end

# @lcpr case=start
# [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]\n
# @lcpr case=end

#
