/*
 * @lc app=leetcode.cn id=1742 lang=typescript
 * @lcpr version=30204
 *
 * [1742] 盒子中小球的最大数量
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function countBalls(lowLimit: number, highLimit: number): number {
  const boxes = new Map();
  for (let i = lowLimit; i <= highLimit; i++) {
    const sum = sumOfDigit(i);
    boxes.set(sum, (boxes.get(sum) || 0) + 1);
  }
  return Math.max(...boxes.values());
};

function sumOfDigit(num: number): number {
  let sum = 0;
  while (num > 0) {
    sum += num % 10;
    num = Math.floor(num / 10);
  }
  return sum;
}
// @lc code=end



// @lcpr case=start
// 1\n10\n
// @lcpr case=end

// @lcpr case=start
// 5\n15\n
// @lcpr case=end

// @lcpr case=start
// 19\n28\n
// @lcpr case=end


