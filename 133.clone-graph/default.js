/*
 * @lc app=leetcode.cn id=133 lang=javascript
 * @lcpr version=30204
 *
 * [133] 克隆图
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * // Definition for a _Node.
 * function _Node(val, neighbors) {
 *    this.val = val === undefined ? 0 : val;
 *    this.neighbors = neighbors === undefined ? [] : neighbors;
 * };
 */

/**
 * @param {_Node} node
 * @return {_Node}
 */
var cloneGraph = function(node) {
  if (node === null) {
    return null;
  }

  const newNodes = new Array(101);
  newNodes[1] = new _Node(1, []);
  const visited = new Array(101).fill(false);
  const queue = [node];
  let queue_i = 0;
  while (queue_i < queue.length) {
    const currentNode = queue[queue_i++];

    if (visited[currentNode.val]) {
      continue;
    }
    visited[currentNode.val] = true;

    for (const neighbor of currentNode.neighbors) {
      if (!newNodes[neighbor.val]) {
        newNodes[neighbor.val] = new _Node(neighbor.val, []);
      }
      newNodes[currentNode.val].neighbors.push(newNodes[neighbor.val]);
      queue.push(neighbor);
    }
  }

  return newNodes[1];
};
// @lc code=end



/*
// @lcpr case=start
// [[2,4],[1,3],[2,4],[1,3]]\n
// @lcpr case=end

// @lcpr case=start
// [[]]\n
// @lcpr case=end

// @lcpr case=start
// []\n
// @lcpr case=end

 */

