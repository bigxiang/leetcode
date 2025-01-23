/*
 * @lc app=leetcode.cn id=1561 lang=javascript
 * @lcpr version=30204
 *
 * [1561] 你可以获得的最大硬币数目
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} piles
 * @return {number}
 */
var maxCoins = function(piles) {
  piles.sort((a, b) => b - a);
  let sum = 0
  for (let i = 0; i < piles.length / 3 * 2; i++) {
    if (i % 2 === 1) sum += piles[i];
  }
  return sum;
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

// @lcpr case=start
// [9,8,7,6,5,1,2,3,4,9,2,3,11,10,3,22,1,2,5,7,8]\n
// @lcpr case=end

// @lcpr case=start
// [9,9,9]\n
// @lcpr case=end

// @lcpr case=start
// [9,9,9,8,8,8]\n
// @lcpr case=end
