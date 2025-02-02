/*
 * @lc app=leetcode.cn id=598 lang=javascript
 * @lcpr version=30204
 *
 * [598] 区间加法 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} m
 * @param {number} n
 * @param {number[][]} ops
 * @return {number}
 */
var maxCount = function(m, n, ops) {
  if (ops.length === 0) return m * n;

  let minX = Infinity, minY = Infinity;
  for (const [x, y] of ops) {
    minX = Math.min(minX, x);
    minY = Math.min(minY, y);
  }
  return minX * minY;
};
// @lc code=end



// @lcpr case=start
// 3\n3\n[[2,2],[3,3]]\n
// @lcpr case=end

// @lcpr case=start
// 3\n3\n[[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3]]\n
// @lcpr case=end

// @lcpr case=start
// 3\n3\n[]\n
// @lcpr case=end


