/*
 * @lc app=leetcode.cn id=547 lang=javascript
 * @lcpr version=30204
 *
 * [547] 省份数量
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} isConnected
 * @return {number}
 */
var findCircleNum = function(isConnected) {
  const visited = new Set();
  let count = 0;

  for (let i = 0; i < isConnected.length; i++) {
    count += dfs(isConnected, visited, i);
  }

  return count;
};

var dfs = function(isConnected, visited, i) {
  if (visited.has(i)) return 0;

  visited.add(i);
  for (let j = 0; j < isConnected[i].length; j++) {
    if (isConnected[i][j] === 1) {
      dfs(isConnected, visited, j);
    }
  }

  return 1;
}
// @lc code=end



// @lcpr case=start
// [[1,1,0],[1,1,0],[0,0,1]]\n
// @lcpr case=end

// @lcpr case=start
// [[1,0,0],[0,1,0],[0,0,1]]\n
// @lcpr case=end


