/*
 * @lc app=leetcode.cn id=624 lang=typescript
 * @lcpr version=30204
 *
 * [624] 数组列表中的最大距离
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function maxDistance(arrays: number[][]): number {
  arrays.sort((a, b) => a[0] - b[0] === 0 ? a[a.length - 1] - b[b.length - 1] : a[0] - b[0]);
  const minMin = arrays[0][0];
  const minMax = arrays[0][arrays[0].length - 1];
  const secMin = arrays[1][0];

  arrays = arrays.slice(1).sort((a, b) => b[b.length - 1] - a[a.length - 1]);
  const max = arrays[0][arrays[0].length - 1];

  return Math.max(Math.abs(minMin - max), Math.abs(secMin - minMax));
};
// @lc code=end



// @lcpr case=start
// [[1,2,3],[4,5],[1,2,3]]\n
// @lcpr case=end

// @lcpr case=start
// [[1],[1]]\n
// @lcpr case=end

// @lcpr case=start
// [[-10,1,3],[-15,0,1,5],[1,2,4]]\n
// @lcpr case=end


// @lcpr case=start
// [[-10,1,3],[-15,0,1,5],[1,2,5]]\n
// @lcpr case=end

// @lcpr case=start
// [[-10,1,3],[-15,0,1,5],[-15,1,2,3],[-15,1,2,4]]\n
// @lcpr case=end

// @lcpr case=start
// [[-2],[-3,-2,1]]\n
// @lcpr case=end
