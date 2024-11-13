#
# @lc app=leetcode.cn id=435 lang=ruby
# @lcpr version=30204
#
# [435] 无重叠区间
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  intervals = intervals.sort
  answer = 0
  curr = intervals[0]
  (1...intervals.size).each do |i|
    if intervals[i][0] < curr[1]
      answer += 1
      curr = intervals[i] if intervals[i][1] < curr[1]
    else
      curr = intervals[i]
    end
  end

  answer
end
# @lc code=end



#
# @lcpr case=start
# [[1,2],[2,3],[3,4],[1,3]]\n
# @lcpr case=end

# @lcpr case=start
# [ [1,2], [1,2], [1,2] ]\n
# @lcpr case=end

# @lcpr case=start
# [ [1,2], [2,3] ]\n
# @lcpr case=end

# @lcpr case=start
# [ [1,5], [2,4], [3,4] ]\n
# @lcpr case=end

#

