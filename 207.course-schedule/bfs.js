/*
 * @lc app=leetcode.cn id=207 lang=javascript
 * @lcpr version=30204
 *
 * [207] 课程表
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {boolean}
 */
var canFinish = function(numCourses, prerequisites) {
  const inAdj = Array.from({ length: numCourses }, () => []);
  const outAdj = Array.from({ length: numCourses }, () => []);
  prerequisites.forEach(([u, v]) => {
    inAdj[u].push(v);
    outAdj[v].push(u);
  })
  const inDegrees = inAdj.map(adj => adj.length);
  const queue = [];
  for (let i = 0; i < numCourses; i++) {
    if (inDegrees[i] === 0) {
      queue.push(i);
    }
  }
  let queue_i = 0;
  while (queue_i < queue.length) {
    const i = queue[queue_i++];
    for (const j of outAdj[i]) {
      inDegrees[j]--;
      if (inDegrees[j] === 0) {
        queue.push(j);
      }
    }
  }

  for (let i = 0; i < numCourses; i++) {
    if (inDegrees[i] !== 0) {
      return false;
    }
  }

  return true;
};
// @lc code=end



// @lcpr case=start
// 2\n[[1,0]]\n
// @lcpr case=end

// @lcpr case=start
// 2\n[[1,0],[0,1]]\n
// @lcpr case=end


