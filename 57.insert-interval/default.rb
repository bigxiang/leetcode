#
# @lc app=leetcode.cn id=57 lang=ruby
# @lcpr version=30204
#
# [57] 插入区间
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  inserted = false
  result = []
  intervals.each do |interval|
    if interval[1] < new_interval[0]
      result << interval
    elsif interval[0] > new_interval[1]
      unless inserted
        result << new_interval
        inserted = true
      end
      result << interval
    else
      new_interval[0] = [new_interval[0], interval[0]].min
      new_interval[1] = [new_interval[1], interval[1]].max
    end
  end
  result << new_interval unless inserted
  result
end
# @lc code=end

#
# @lcpr case=start
# [[1,3],[6,9]]\n[2,5]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2],[3,5],[6,7],[8,10],[12,16]]\n[4,8]\n
# @lcpr case=end

# @lcpr case=start
# []\n[4,8]\n
# @lcpr case=end

# @lcpr case=start
# [[1,5]]\n[2,3]\n
# @lcpr case=end
#
