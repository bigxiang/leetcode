/*
 * @lc app=leetcode.cn id=790 lang=javascript
 * @lcpr version=30204
 *
 * [790] 多米诺和托米诺平铺
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @return {number}
 */

// Solution: https://leetcode.cn/problems/domino-and-tromino-tiling/solutions/1968516/by-endlesscheng-umpp/?envType=study-plan-v2&envId=leetcode-75
var numTilings = function(n) {
  const pres = [0, 1, 2, 5];
  if (n <= 3) return pres[n];

  const mod = 10**9 + 7;
  let curr;
  for (let i = 4; i <= n; i++) {
    curr = (2 * pres[3] + pres[1]) % mod;
    [pres[1], pres[2], pres[3]] = [pres[2], pres[3], curr];
  }

  return curr;
};
// @lc code=end



// @lcpr case=start
// 3\n
// @lcpr case=end

// @lcpr case=start
// 1\n
// @lcpr case=end

// @lcpr case=start
// 50\n
// @lcpr case=end




