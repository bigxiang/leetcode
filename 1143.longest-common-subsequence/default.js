/*
 * @lc app=leetcode.cn id=1143 lang=javascript
 * @lcpr version=30204
 *
 * [1143] 最长公共子序列
 */

// @lc code=start
/**
 * @param {string} text1
 * @param {string} text2
 * @return {number}
 */
var longestCommonSubsequence = function(text1, text2) {
  const cache = new Array(text1.length).fill(0).map(() => new Array(text2.length).fill(-1));

  return dfs(text1, text2, 0, 0, cache);
};

var dfs = function(text1, text2, i, j, cache) {
  if (i === text1.length || j === text2.length) return 0;

  if (cache[i][j] !== -1) return cache[i][j];

  if (text1[i] === text2[j]) {
    cache[i][j] = 1 + dfs(text1, text2, i+1, j+1, cache);
  } else {
    cache[i][j] = Math.max(dfs(text1, text2, i+1, j, cache), dfs(text1, text2, i, j+1, cache));
  }

  return cache[i][j];
}

// @lc code=end



// @lcpr case=start
// "abcde"\n"ace"\n
// @lcpr case=end

// @lcpr case=start
// "abc"\n"abc"\n
// @lcpr case=end

// @lcpr case=start
// "abc"\n"def"\n
// @lcpr case=end


