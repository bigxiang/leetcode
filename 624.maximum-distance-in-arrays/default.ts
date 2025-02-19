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
  let min = arrays[0][0];
  let max = arrays[0][arrays[0].length - 1];
  let result = 0;
  for (let i = 1; i < arrays.length; i++) {
    result = Math.max(result, Math.abs(arrays[i][0] - max), Math.abs(arrays[i][arrays[i].length - 1] - min));
    min = Math.min(min, arrays[i][0]);
    max = Math.max(max, arrays[i][arrays[i].length - 1]);
  }
  return result;
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
