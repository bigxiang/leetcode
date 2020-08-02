require 'pp'
#
# @lc app=leetcode id=363 lang=ruby
#
# [363] Max Sum of Rectangle No Larger Than K
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def max_sum_submatrix(matrix, k)
  return 0 if matrix.empty? || matrix[0].empty?

  rows = matrix.size
  cols = matrix[0].size
  max = -Float::INFINITY

  (0..cols-1).each do |left|
    row_sums = Array.new(rows, 0)

    (left..cols-1).each do |right|
      (0..rows-1).each do |row|
        row_sums[row] += matrix[row][right]
      end
      max = [max, max_sum_subarray(row_sums, k)].max
    end
  end

  max
end

def max_sum_subarray(nums, k)
  curr_max = -Float::INFINITY
  result = -Float::INFINITY

  nums.each_with_index do |n, i|
    curr_max = [curr_max + n, n].max
    result = [curr_max, result].max
  end

  return result if result <= k

  result = -Float::INFINITY

  (0..nums.size-1).each do |i|
    sum = 0
    (i..nums.size-1).each do |j|
      sum += nums[j]
      return k if sum == k
      result = [result, sum].max if sum < k
    end
  end

  result
end
# @lc code=end

puts max_sum_subarray([0,  1, 2, -1], 4)


puts max_sum_submatrix(
  [
    [1,  0, 1,  2],
    [0, -2, 3,  2],
    [0,  1, 2, -1],
    [0,  0, 1,  1],
  ], 10
)
puts max_sum_submatrix(
  [
    [ 5, -4, -3,  4],
    [-3, -4,  4,  5],
    [ 5,  1,  5, -4]
  ], 9
)

puts max_sum_submatrix(
  [
    [ 5, -4, -3,  4],
    [-3, -4,  4,  5],
    [ 5,  1,  5, -4]
  ], 8
)

# puts max_sum_submatrix(
#   [
#     [1,  0, 1],
#     [0, -2, 3]
#   ], 2
# )
