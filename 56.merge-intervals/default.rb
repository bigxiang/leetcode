#
# @lc app=leetcode id=56 lang=ruby
#
# [56] Merge Intervals
#

# @lc code=start
# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  intervals = intervals.sort_by { |int| int[0] }

  new_intervals = []
  i = 0
  while i < intervals.size
    curr_interval = intervals[i]
    if i != intervals.size - 1 && curr_interval[1] >= intervals[i+1][0]
      intervals[i+1][0] = curr_interval[0]
      intervals[i+1][1] = [intervals[i+1][1], curr_interval[1]].max
    else
      new_intervals << curr_interval
    end

    i += 1
  end
  new_intervals
end
# @lc code=end

