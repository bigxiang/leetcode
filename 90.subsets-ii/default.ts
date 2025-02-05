/*
 * @lc app=leetcode.cn id=90 lang=typescript
 * @lcpr version=30204
 *
 * [90] 子集 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function subsetsWithDup(nums: number[]): number[][] {
  const result: number[][] = [];
  const numsCount: Map<number, number> = new Map();
  for (const num of nums) {
    numsCount.set(num, (numsCount.get(num) || 0) + 1);
  }

  for (let i = 0; i <= nums.length; i++) {
    dfs([...numsCount.keys()], 0, numsCount, 0, i, [], result);
  }

  return result;
};

function dfs(nums: number[], index: number, numsCount: Map<number, number>, count: number, maxLength: number, path: number[], result: number[][]): void {
  if (path.length === maxLength) {
    result.push([...path]);
    return;
  }
  if (index === nums.length) return;

  if (count < (numsCount.get(nums[index]) || 0)) {
    path.push(nums[index]);
    dfs(nums, index, numsCount, count + 1, maxLength, path, result);
    path.pop();
  }
  dfs(nums, index + 1, numsCount, 0, maxLength, path, result);
}
// @lc code=end



// @lcpr case=start
// [1,2,2]\n
// @lcpr case=end

// @lcpr case=start
// [0]\n
// @lcpr case=end


