/*
 * @lc app=leetcode.cn id=994 lang=javascript
 * @lcpr version=30204
 *
 * [994] 腐烂的橘子
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} grid
 * @return {number}
 */
var orangesRotting = function(grid) {
  const queue = [];
  const freshSet = new Set();
  for (let i = 0; i < grid.length; i++) {
    for (let j = 0; j < grid[0].length; j++) {
      if (grid[i][j] === 2) {
        queue.push([i, j]);
      }

      if (grid[i][j] === 1) {
        freshSet.add([i, j].join(','));
      }
    }
  }
  if (freshSet.size === 0) return 0;

  let queue_i = 0;
  let minutes = -1;
  while (queue_i < queue.length) {
    let currMinLength = queue.length - queue_i;
    let currMinIndex = queue_i + currMinLength;
    while (queue_i < currMinIndex) {
      const [i, j] = queue[queue_i++];

      if (i < 0 || j < 0 || i >= grid.length || j >= grid[0].length) {
        continue;
      }

      if (grid[i][j] === 0) {
        continue;
      }
      grid[i][j] = 0;
      if (freshSet.has([i, j].join(','))) {
        freshSet.delete([i, j].join(','));
      }

      [[0, 1], [0, -1], [1, 0], [-1, 0]].forEach(([di, dj]) => {
        queue.push([i + di, j + dj]);
      })
    }
    minutes++;

    if (freshSet.size === 0) return minutes;
  }

  return -1;
};
// @lc code=end



// @lcpr case=start
// [[2,1,1],[1,1,0],[0,1,1]]\n
// @lcpr case=end

// @lcpr case=start
// [[2,1,1],[0,1,1],[1,0,1]]\n
// @lcpr case=end

// @lcpr case=start
// [[0,2]]\n
// @lcpr case=end

// @lcpr case=start
// [[2,2]]\n
// @lcpr case=end
