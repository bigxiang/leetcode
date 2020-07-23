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

  m = matrix.size
  n = matrix[0].size

  # Only if m * n does not exceed integer limit.
  lo = 0
  hi = m * n - 1

  while lo <= hi
    mid = lo + (hi - lo) / 2
    i = mid / n
    j = mid % n

    if matrix[i][j] == target
      return true
    elsif matrix[i][j] > target
      hi = mid - 1
    elsif matrix[i][j] < target
      lo = mid + 1
    end
  end

  false
end
# @lc code=end

