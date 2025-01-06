/*
 * @lc app=leetcode.cn id=216 lang=javascript
 * @lcpr version=30204
 *
 * [216] 组合总和 III
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} k
 * @param {number} n
 * @return {number[][]}
 */
var combinationSum3 = function(k, n) {
  const nums = Array.from({length: 9}, (_, i) => i+1);

  const result = [];
  dfs(nums, 0, k, n, [], result);

  return result;
};

var dfs = function(nums, i, k, n, path, result) {
  if (n === 0 && path.length === k) {
    result.push(path);
    return;
  }

  if (path.length === k) return;
  if (n < 0) return;
  if (i >= nums.length) return;

  dfs(nums, i+1, k, n-nums[i], [...path, nums[i]], result);
  dfs(nums, i+1, k, n, [...path], result);
}
// @lc code=end



// @lcpr case=start
// 3\n7\n
// @lcpr case=end

// @lcpr case=start
// 3\n9\n
// @lcpr case=end

// @lcpr case=start
// 4\n1\n
// @lcpr case=end


