#
# @lc app=leetcode.cn id=119 lang=ruby
# @lcpr version=30204
#
# [119] 杨辉三角 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index.zero?
  return [1, 1] if row_index == 1

  row = [1, 1]
  (2..row_index).each do |n|
    pre = 0
    (0..row.size).each do |i|
      pre, row[i] = row[i], (row[i] || 0) + pre
    end
  end
  row
end
# @lc code=end

#
# @lcpr case=start
# 3\n
# @lcpr case=end

# @lcpr case=start
# 0\n
# @lcpr case=end

# @lcpr case=start
# 1\n
# @lcpr case=end

# @lcpr case=start
# 7\n
# @lcpr case=end
#
