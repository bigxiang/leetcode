/*
 * @lc app=leetcode.cn id=1466 lang=javascript
 * @lcpr version=30204
 *
 * [1466] 重新规划路线
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @param {number[][]} connections
 * @return {number}
 */
var minReorder = function(n, connections) {
  const outEdges = new Map();
  const inEdges = new Map();

  for (const [u, v] of connections) {
    outEdges.set(u, (outEdges.get(u) || []).concat(v));
    inEdges.set(v, (inEdges.get(v) || []).concat(u));
  }

  const visited = new Set();
  const queue = [0];
  let queue_i = 0;
  let count = 0;

  while (queue_i < queue.length) {
    const city = queue[queue_i++];

    if (visited.has(city)) {
      continue;
    }

    visited.add(city);
    for (const neighbor of outEdges.get(city) || []) {
      queue.push(neighbor);
      if (!visited.has(neighbor)) count++;
    }
    for (const neighbor of inEdges.get(city) || []) {
      queue.push(neighbor);
    }
  }

  return count;
};
// @lc code=end



// @lcpr case=start
// 6\n[[0,1],[1,3],[2,3],[4,0],[4,5]]\n
// @lcpr case=end

// @lcpr case=start
// 5\n[[1,0],[1,2],[3,2],[3,4]]\n
// @lcpr case=end

// @lcpr case=start
// 3\n[[1,0],[2,0]]\n
// @lcpr case=end


