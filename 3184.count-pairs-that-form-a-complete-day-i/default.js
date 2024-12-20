/*
 * @lc app=leetcode.cn id=3184 lang=javascript
 * @lcpr version=30204
 *
 * [3184] 构成整天的下标对数目 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} hours
 * @return {number}
 */
var countCompleteDayPairs = function(hours) {
  const hoursMap = new Map();
  let result = 0;
  hoursMap.set(hours[0] % 24, 1)

  for (let i = 1; i < hours.length; i++) {
    const mod = hours[i] % 24;
    const mod_needed = (mod === 0) ? 0 : 24 - mod;
    if (hoursMap.has(mod_needed)) {
      result += hoursMap.get(mod_needed)
    }

    hoursMap.set(mod, (hoursMap.get(mod) || 0) + 1);
  }

  return result;
};
// @lc code=end



/*
// @lcpr case=start
// [12,12,30,24,24]\n
// @lcpr case=end

// @lcpr case=start
// [72,48,24,3]\n
// @lcpr case=end

// @lcpr case=start
// [72]\n
// @lcpr case=end

// @lcpr case=start
// [72,48,24,3,21,45]\n
// @lcpr case=end


 */

