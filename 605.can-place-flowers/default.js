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
  let availablePlot = 0;
  let maxFlowers = 0;
  for (let i = 0; i < flowerbed.length; i++) {
    if (flowerbed[i] === 0 &&
      (i === 0 || flowerbed[i-1] !== 1) &&
      (i === flowerbed.length - 1 || flowerbed[i+1] !== 1)
    ) availablePlot++;
    else {
      maxFlowers += Math.floor((availablePlot + 1) / 2);
      availablePlot = 0;
    }
  }
  maxFlowers += Math.floor((availablePlot + 1) / 2);
  return maxFlowers >= n;
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
