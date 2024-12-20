/*
 * @lc app=leetcode.cn id=39 lang=javascript
 * @lcpr version=30204
 *
 * [39] 组合总和
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
  const result = [];

  dfs(candidates, target, 0, [], result);

  return result;
};

var dfs = function(candidates, target, i, combination, result) {
  if (i >= candidates.length) {
    return;
  }

  if (target < 0) {
    return;
  }

  if (target == 0) {
    result.push(combination);
    return;
  }

  dfs(candidates, target - candidates[i], i, [...combination, candidates[i]], result);
  dfs(candidates, target, i + 1, [...combination], result);
}
// @lc code=end



/*
// @lcpr case=start
// [2,3,6,7]\n7\n
// @lcpr case=end

// @lcpr case=start
// [2,3,5]\n8\n
// @lcpr case=end

// @lcpr case=start
// [2]\n1\n
// @lcpr case=end

 */

