/*
 * @lc app=leetcode.cn id=2352 lang=javascript
 * @lcpr version=30204
 *
 * [2352] 相等行列对
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} grid
 * @return {number}
 */
var equalPairs = function(grid) {
  const rowMap = new Map();
  for (let i = 0; i < grid.length; i++) {
    const key = getRowKey(grid, i);
    rowMap.set(key, (rowMap.get(key) || 0) + 1);
  }

  let result = 0;
  for (let j = 0; j < grid[0].length; j++) {
    const key = getColKey(grid, j);
    result += (rowMap.get(key) || 0);
  }

  return result;
};

var getRowKey = function(grid, i) {
  return grid[i].map((num) => String(num).padStart(6, '0')).join(',');
}

var getColKey = function(grid, j) {
  const keys = [];
  for (let i = 0; i < grid.length; i++) {
    keys.push(String(grid[i][j]).padStart(6, '0'));
  }
  return keys.join(',');
}
// @lc code=end



// @lcpr case=start
// [[3,2,1],[1,7,6],[2,7,7]]\n
// @lcpr case=end

// @lcpr case=start
// [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]\n
// @lcpr case=end


