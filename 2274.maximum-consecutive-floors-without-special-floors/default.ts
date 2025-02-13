/*
 * @lc app=leetcode.cn id=2274 lang=typescript
 * @lcpr version=30204
 *
 * [2274] 不含特殊楼层的最大连续楼层数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function maxConsecutive(bottom: number, top: number, special: number[]): number {
  special.sort((a, b) => a - b);

  let max: number = 0, floors: number = 0;
  for (let i: number = 0; i < special.length; i++) {
    if (i === 0) floors = special[i] - bottom;
    else floors = special[i] - special[i - 1] - 1;
    max = Math.max(max, floors);
  }

  return Math.max(max, top - special[special.length - 1]);
};
// @lc code=end



// @lcpr case=start
// 2\n9\n[4,6]\n
// @lcpr case=end

// @lcpr case=start
// 6\n8\n[7,6,8]\n
// @lcpr case=end

// @lcpr case=start
// 1\n8\n[2,6,5,8]\n
// @lcpr case=end

