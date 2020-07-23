#
# @lc app=leetcode id=74 lang=ruby
#
# [74] Search a 2D Matrix
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.size == 0 || matrix[0].size == 0

  # Didn't use pivot index because I don't know how large i * j will be.
  lo_i = 0
  lo_j = 0
  hi_i = matrix.size - 1
  hi_j = matrix[0].size - 1

  while lo_i <= hi_i && lo_j <= hi_j
    mid_i = lo_i + (hi_i - lo_i) / 2
    mid_j = lo_j + (hi_j - lo_j) / 2

    if matrix[mid_i][mid_j] == target
      return true
    elsif matrix[mid_i][mid_j] > target
      if matrix[mid_i][0] <= target
        hi_j = mid_j - 1
      else
        hi_i = mid_i - 1
        lo_j = 0
        hi_j = matrix[0].size - 1
      end
    elsif matrix[mid_i][mid_j] < target
      if matrix[mid_i][-1] >= target
        lo_j = mid_j + 1
      else
        lo_i = mid_i + 1
        lo_j = 0
        hi_j = matrix[0].size - 1
      end
    end
  end

  false
end
# @lc code=end

