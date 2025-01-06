/*
 * @lc app=leetcode.cn id=875 lang=javascript
 * @lcpr version=30204
 *
 * [875] 爱吃香蕉的珂珂
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} piles
 * @param {number} h
 * @return {number}
 */
var minEatingSpeed = function(piles, h) {
  piles.sort((a, b) => a - b);
  if (piles.length === h) return piles[piles.length - 1];

  let lo = 1;
  let hi = piles[piles.length - 1];
  while (lo <= hi) {
    const mid = lo + ((hi - lo) >> 1);

    const hours = piles.map(pile => Math.ceil(pile / mid)).reduce((acc, cur) => acc + cur, 0);
    if (hours > h) lo = mid + 1;
    else hi = mid - 1;
  }

  return lo;
};
// @lc code=end



// @lcpr case=start
// [3,6,7,11]\n8\n
// @lcpr case=end

// @lcpr case=start
// [30,11,23,4,20]\n5\n
// @lcpr case=end

// @lcpr case=start
// [30,11,23,4,20]\n6\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1,999999999]\n10\n
// @lcpr case=end


