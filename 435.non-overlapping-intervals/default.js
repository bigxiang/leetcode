/*
 * @lc app=leetcode.cn id=435 lang=javascript
 * @lcpr version=30204
 *
 * [435] 无重叠区间
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} intervals
 * @return {number}
 */
var eraseOverlapIntervals = function(intervals) {
  if (intervals.length === 1) return 0;

  intervals.sort((a, b) => {
    if (a[0] === b[0]) return a[1] - b[1];
    return a[0] - b[0];
  });

  let pre = 0;
  let count = 0;
  for (let i = 1; i < intervals.length; i++) {
    if (intervals[i][0] < intervals[pre][1]) {
      if (intervals[i][1] < intervals[pre][1]) pre = i;
      count++;
    }
    else pre = i;
  }
  return count;
};
// @lc code=end



// @lcpr case=start
// [[1,2],[2,3],[3,4],[1,3]]\n
// @lcpr case=end

// @lcpr case=start
// [ [1,2], [1,2], [1,2] ]\n
// @lcpr case=end

// @lcpr case=start
// [ [1,2], [2,3] ]\n
// @lcpr case=end

// @lcpr case=start
// [[0,2],[1,3],[2,4],[3,5],[4,6]]\n
// @lcpr case=end


// @lcpr case=start
// [[0,4],[1,3],[2,4],[3,5],[4,6]]\n
// @lcpr case=end
