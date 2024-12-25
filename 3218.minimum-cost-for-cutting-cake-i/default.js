/*
 * @lc app=leetcode.cn id=3218 lang=javascript
 * @lcpr version=30204
 *
 * [3218] 切蛋糕的最小总开销 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} m
 * @param {number} n
 * @param {number[]} horizontalCut
 * @param {number[]} verticalCut
 * @return {number}
 */
var minimumCost = function(m, n, horizontalCut, verticalCut) {
  let cakes = [[[0, 0], [m, n]]];
  let cakes_i = 0;
  let cost = 0;

  while (cakes_i < cakes.length) {
    const cake = cakes[cakes_i++];

    cost += cut(cake, horizontalCut, verticalCut, cakes);
  }

  return cost;
};

var cut = function(cake, horizontalCut, verticalCut, cakes) {
  const leftTop = cake[0];
  const rightBottom = cake[1]

  if (leftTop[0] + 1 === rightBottom[0] && leftTop[1] + 1 === rightBottom[1]) {
    return 0;
  }

  let minCost = 0;
  let cutPoint = ['h', 0];
  for (let i = leftTop[0] + 1; i < rightBottom[0]; i++) {
    const cost = horizontalCut[i-1];
    if (cost > minCost) {
      minCost = cost;
      cutPoint = ['h', i];
    }
  }

  for (let i = leftTop[1] + 1; i < rightBottom[1]; i++) {
    const cost = verticalCut[i-1];
    if (cost > minCost) {
      minCost = cost;
      cutPoint = ['v', i];
    }
  }

  if (cutPoint[0] === 'h') {
    cakes.push([[leftTop[0], leftTop[1]], [cutPoint[1], rightBottom[1]]]);
    cakes.push([[cutPoint[1], leftTop[1]], [rightBottom[0], rightBottom[1]]]);
  }
  else {
    cakes.push([[leftTop[0], leftTop[1]], [rightBottom[0], cutPoint[1]]]);
    cakes.push([[leftTop[0], cutPoint[1]], [rightBottom[0], rightBottom[1]]]);
  }

  return minCost;
}
// @lc code=end



// @lcpr case=start
// 3\n2\n[1,3]\n[5]\n
// @lcpr case=end

// @lcpr case=start
// 2\n2\n[7]\n[4]\n
// @lcpr case=end


// @lcpr case=start
// 1\n1\n[]\n[]\n
// @lcpr case=end

// @lcpr case=start
// 3\n2\n[1,3]\n[2]\n
// @lcpr case=end

// @lcpr case=start
// 2\n3\n[2]\n[1,3]\n
// @lcpr case=end

// @lcpr case=start
// 2\n4\n[4]\n[1,5,2]\n
// @lcpr case=end

// @lcpr case=start
// 3\n2\n[2,2]\n[2]\n
// @lcpr case=end
