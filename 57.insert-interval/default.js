/*
 * @lc app=leetcode.cn id=57 lang=javascript
 * @lcpr version=30204
 *
 * [57] 插入区间
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} intervals
 * @param {number[]} newInterval
 * @return {number[][]}
 */
var insert = function(intervals, newInterval) {
  const result = [];
  let inserted = false

  intervals.forEach(interval => {
    if (inserted) {
      result.push(interval);
    }
    else {
      if (newInterval[1] < interval[0]) {
        result.push(newInterval);
        result.push(interval);
        inserted = true;
      } else if (newInterval[0] > interval[1]) {
        result.push(interval);
      } else {
        newInterval[0] = Math.min(newInterval[0], interval[0]);
        newInterval[1] = Math.max(newInterval[1], interval[1]);
      }
    }
  });

  if (!inserted) {
    result.push(newInterval);
  }

  return result;
};
// @lc code=end



/*
// @lcpr case=start
// [[1,3],[6,9]]\n[2,5]\n
// @lcpr case=end

// @lcpr case=start
// [[1,2],[3,5],[6,7],[8,10],[12,16]]\n[4,8]\n
// @lcpr case=end

// @lcpr case=start
// [[3,5],[6,7],[8,10],[12,16]]\n[1,2]\n
// @lcpr case=end

// @lcpr case=start
// [[3,5],[6,7],[8,10],[12,16]]\n[17,20]\n
// @lcpr case=end

// @lcpr case=start
// [[3,5],[6,7],[8,10],[12,16]]\n[16,20]\n
// @lcpr case=end

// @lcpr case=start
// []\n[16,20]\n
// @lcpr case=end
*/

