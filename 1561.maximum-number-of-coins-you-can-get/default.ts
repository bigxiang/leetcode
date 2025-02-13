/*
 * @lc app=leetcode.cn id=1561 lang=typescript
 * @lcpr version=30204
 *
 * [1561] 你可以获得的最大硬币数目
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function maxCoins(piles: number[]): number {
  piles.sort((a, b) => b - a);
  let result: number = 0;
  for (let i:number = 1; i < piles.length / 3 * 2; i += 2) {
    result += piles[i];
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// [2,4,1,2,7,8]\n
// @lcpr case=end

// @lcpr case=start
// [2,4,5]\n
// @lcpr case=end

// @lcpr case=start
// [9,8,7,6,5,1,2,3,4]\n
// @lcpr case=end


