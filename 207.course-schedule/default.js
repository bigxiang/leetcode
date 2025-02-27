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
  const coursesAdj = Array.from({ length: numCourses }, () => []);
  prerequisites.forEach(([u, v]) => {
    coursesAdj[u].push(v);
  })
  const visited = Array.from({ length: numCourses }, () => 0);
  for (let i = 0; i < numCourses; i++) {
    if (!dfs(coursesAdj, visited, i)) {
      return false;
    }
  }
  return true;
};

var dfs = function(coursesAdj, visited, i) {
  if (visited[i] === 1) return false;
  if (visited[i] === 2) return true;

  visited[i] = 1;
  for (course of coursesAdj[i]) {
    if (!dfs(coursesAdj, visited, course)) {
      return false;
    }
  }

  visited[i] = 2;
  return true;
}
// @lc code=end



// @lcpr case=start
// 2\n[[1,0]]\n
// @lcpr case=end

// @lcpr case=start
// 2\n[[1,0],[0,1]]\n
// @lcpr case=end


