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
  let graph = Array.from({length: numCourses}, () => []);
  let visited = new Array(numCourses).fill(0);
  prerequisites.forEach(([u, v]) => graph[v].push(u));
  for (let i = 0; i < numCourses; i++) {
    if (!dfs(graph, visited, i)) return false;
  }
  return true;
};

const dfs = (graph, visited, n) => {
  if (visited[n] === 1) return false;
  if (visited[n] === 2) return true;
  visited[n] = 1;
  for (let nn of graph[n]) {
    if (!dfs(graph, visited, nn)) return false;
  }
  visited[n] = 2;
  return true;
}
// @lc code=end



// @lcpr case=start
// 2\n[[1,0]]\n
// @lcpr case=end

// @lcpr case=start
// 2\n[[1,0],[0,1]]\n
// @lcpr case=end


