/*
 * @lc app=leetcode.cn id=399 lang=javascript
 * @lcpr version=30204
 *
 * [399] 除法求值
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[][]} equations
 * @param {number[]} values
 * @param {string[][]} queries
 * @return {number[]}
 */
var calcEquation = function(equations, values, queries) {
  const outEdges = new Map();
  const inEdges = new Map();
  for (let i = 0; i < equations.length; i++) {
    const [u, v] = equations[i];
    const value = values[i];
    if (!outEdges.has(u)) outEdges.set(u, new Map());
    outEdges.get(u).set(v, value);

    if (!inEdges.has(v)) inEdges.set(v, new Map());
    inEdges.get(v).set(u, value);
  }

  const result = [];
  for (let i = 0; i < queries.length; i++) {
    const [u, v] = queries[i];
    const visited = new Set();
    result.push(calc(outEdges, inEdges, u, v, 1, visited));
  }

  return result;
};

var calc = function(outEdges, inEdges, u, v, curr, visited) {
  if (visited.has(u)) return -1;
  visited.add(u);

  if (!outEdges.has(u) && !inEdges.has(u)) return -1;

  if (outEdges.has(u) && outEdges.get(u).has(v)) {
    return curr * outEdges.get(u).get(v);
  }

  if (inEdges.has(u) && inEdges.get(u).has(v)) {
    return curr / inEdges.get(u).get(v);
  }

  if (outEdges.has(u)) {
    for (const [next, value] of outEdges.get(u)) {
      const result = calc(outEdges, inEdges, next, v, curr * value, visited);
      if (result !== -1) return result;
    }
  }

  if (inEdges.has(u)) {
    for (const [next, value] of inEdges.get(u)) {
      const result = calc(outEdges, inEdges, next, v, curr / value, visited);
      if (result !== -1) return result;
    }
  }

  return -1;
}
// @lc code=end



// @lcpr case=start
// [["a","b"],["b","c"]]\n[2.0,3.0]\n[["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]\n
// @lcpr case=end

// @lcpr case=start
// [["a","b"],["b","c"],["bc","cd"]]\n[1.5,2.5,5.0]\n[["a","c"],["c","b"],["bc","cd"],["cd","bc"]]\n
// @lcpr case=end

// @lcpr case=start
// [["a","b"]]\n[0.5]\n[["a","b"],["b","a"],["a","c"],["x","y"]]\n
// @lcpr case=end


