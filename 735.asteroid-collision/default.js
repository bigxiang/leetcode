/*
 * @lc app=leetcode.cn id=735 lang=javascript
 * @lcpr version=30204
 *
 * [735] 小行星碰撞
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} asteroids
 * @return {number[]}
 */
var asteroidCollision = function(asteroids) {
  const result = [];
  let i = 0;

  while (i < asteroids.length) {
    while (result.length > 0 && result[result.length - 1] > 0 && asteroids[i] < 0) {
      if (result[result.length - 1] < -asteroids[i]) {
        result.pop();
      }
      else if (result[result.length - 1] === -asteroids[i]) {
        result.pop();
        i++;
      }
      else {
        i++;
      }
    }

    if (i < asteroids.length) {
      result.push(asteroids[i]);
      i++;
    }
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [5,10,-5]\n
// @lcpr case=end

// @lcpr case=start
// [8,-8]\n
// @lcpr case=end

// @lcpr case=start
// [10,2,-5]\n
// @lcpr case=end


// @lcpr case=start
// [-2,-3]\n
// @lcpr case=end

// @lcpr case=start
// [-2,3,-1,-4]\n
// @lcpr case=end
