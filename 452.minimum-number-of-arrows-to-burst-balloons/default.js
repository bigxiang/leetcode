/*
 * @lc app=leetcode.cn id=452 lang=javascript
 * @lcpr version=30204
 *
 * [452] 用最少数量的箭引爆气球
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} points
 * @return {number}
 */
var findMinArrowShots = function(points) {
  if (points.length === 1) return 1;

  points.sort((a, b) => {
    if (a[0] === b[0]) return a[1] - b[1];
    return a[0] - b[0];
  })

  let lastOverlapping = points[0];
  let count = 1;

  for (let i = 1; i < points.length; i++) {
    if (points[i][0] <= lastOverlapping[1]) {
      lastOverlapping = [points[i][0], Math.min(points[i][1], lastOverlapping[1])];
    }
    else lastOverlapping = points[i], count++;
  }

  return count;
};
// @lc code=end



// @lcpr case=start
// [[10,16],[2,8],[1,6],[7,12]]\n
// @lcpr case=end

// @lcpr case=start
// [[1,2],[3,4],[5,6],[7,8]]\n
// @lcpr case=end

// @lcpr case=start
// [[1,2],[2,3],[3,4],[4,5]]\n
// @lcpr case=end


