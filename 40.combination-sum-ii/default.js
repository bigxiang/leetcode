/*
 * @lc app=leetcode.cn id=40 lang=javascript
 * @lcpr version=30204
 *
 * [40] 组合总和 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum2 = function(candidates, target) {
  const result = [];
  const candidateMap = new Map();
  candidates.forEach(c => {
    candidateMap.set(c, (candidateMap.get(c) || 0) + 1);
  })
  const candidateKeys = Array.from(candidateMap.keys()).sort((a, b) => a - b);

  dfs(candidateMap, candidateKeys, target, 0, 0, [], result);

  return result;
};

var dfs = function(candidateMap, candidateKeys, target, i, count, seq, result) {
  if (target === 0) {
    result.push(seq);
    return;
  }

  if (target < 0 || i === candidateKeys.length) {
    return;
  }

  if (count < candidateMap.get(candidateKeys[i])) {
    dfs(candidateMap, candidateKeys, target - candidateKeys[i], i, count + 1, [...seq, candidateKeys[i]], result);
  }
  dfs(candidateMap, candidateKeys, target, i + 1, 0, seq, result);
}
// @lc code=end



// @lcpr case=start
// [10,1,2,7,6,1,5]\n8\n
// @lcpr case=end

// @lcpr case=start
// [2,5,2,1,2]\n5\n
// @lcpr case=end


