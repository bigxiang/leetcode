/*
 * @lc app=leetcode.cn id=1287 lang=typescript
 * @lcpr version=30204
 *
 * [1287] 有序数组中出现次数超过25%的元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function findSpecialInteger(arr: number[]): number {
  const minCount = Math.ceil((arr.length + 1) / 4);
  for (let i = 0; i < arr.length; i++) {
    if (i !== 0 && arr[i] === arr[i - 1]) continue;

    if (arr[i] === arr[i + minCount - 1]) return arr[i];
  }

  throw new Error('wtf');
};
// @lc code=end



// @lcpr case=start
// [1,2,2,6,6,6,6,7,10]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,2,2,6,6,6,6,7,10,11,12]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end
