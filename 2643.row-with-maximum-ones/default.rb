#
# @lc app=leetcode.cn id=2643 lang=ruby
# @lcpr version=30204
#
# [2643] 一最多的行
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} mat
# @return {Integer[]}
def row_and_maximum_ones(mat)
  mat.each_with_object([0, 0]).with_index do |(row, result), i|
    sum = row.sum
    if sum > result[1]
      result[0] = i
      result[1] = sum
    end
  end
end
# @lc code=end



#
# @lcpr case=start
# [[0,1],[1,0]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0,0],[0,1,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0],[1,1],[0,0]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0],[0,0],[0,0]]\n
# @lcpr case=end

#

