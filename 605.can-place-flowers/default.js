/*
 * @lc app=leetcode.cn id=605 lang=javascript
 * @lcpr version=30204
 *
 * [605] 种花问题
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} flowerbed
 * @param {number} n
 * @return {boolean}
 */
var canPlaceFlowers = function(flowerbed, n) {
  const availableBeds = [];
  let bed = [];
  for (let i = 0; i < flowerbed.length; i++) {
    if ((i === 0 || flowerbed[i - 1] === 0) && flowerbed[i] === 0) {
      bed.push(0);
    }

    if (flowerbed[i] === 1) {
      bed.pop();
      if (bed.length > 0) availableBeds.push(bed);
      bed = [];
    }
  }

  if (bed.length > 0) availableBeds.push(bed);

  return availableBeds.map((bed) => Math.round(bed.length / 2)).reduce((a, b) => a + b, 0) >= n;
};
// @lc code=end



// @lcpr case=start
// [1,0,0,0,1]\n1\n
// @lcpr case=end

// @lcpr case=start
// [1,0,0,0,1]\n2\n
// @lcpr case=end

// @lcpr case=start
// [0,0,1,0,0,0,1,0,0]\n3\n
// @lcpr case=end
