/*
 * @lc app=leetcode.cn id=72 lang=javascript
 * @lcpr version=30204
 *
 * [72] 编辑距离
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(word1, word2) {
  const cache = new Array(word1.length).fill(0).map(() => new Array(word2.length).fill(Number.MAX_SAFE_INTEGER));

  return dfs(word1, word2, 0, 0, cache);
};

var dfs = function(word1, word2, i, j, cache) {
  if (i === word1.length) return word2.length - j;
  if (j === word2.length) return word1.length - i;

  if (cache[i][j] !== Number.MAX_SAFE_INTEGER) return cache[i][j];

  if (word1[i] === word2[j]) {
    cache[i][j] = dfs(word1, word2, i+1, j+1, cache);
  }
  else {
    cache[i][j] = Math.min(
      dfs(word1, word2, i+1, j, cache) + 1,
      dfs(word1, word2, i+1, j+1, cache) + 1,
      dfs(word1, word2, i, j+1, cache) + 1,
    )
  }

  return cache[i][j];
}
// @lc code=end



// @lcpr case=start
// "horse"\n"ros"\n
// @lcpr case=end

// @lcpr case=start
// "intention"\n"execution"\n
// @lcpr case=end

