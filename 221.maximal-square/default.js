/*
 * @lc app=leetcode.cn id=221 lang=javascript
 * @lcpr version=30204
 *
 * [221] 最大正方形
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {character[][]} matrix
 * @return {number}
 */
var maximalSquare = function(matrix) {
  const dp = new Array(matrix.length).fill(0).map(() => new Array(matrix[0].length).fill(0));
  let max = 0;
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[0].length; j++) {
      if (matrix[i][j] === '0') continue;

      if (i === 0 || j === 0) dp[i][j] = matrix[i][j] === '1' ? 1 : 0;
      else dp[i][j] = Math.min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1;

      max = Math.max(max, dp[i][j]);
    }
  }

  return max ** 2;
};
// @lc code=end



// @lcpr case=start
// [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]\n
// @lcpr case=end

// @lcpr case=start
// [["0","1"],["1","0"]]\n
// @lcpr case=end

// @lcpr case=start
// [["0"]]\n
// @lcpr case=end


