/*
 * @lc app=leetcode.cn id=1732 lang=javascript
 * @lcpr version=30204
 *
 * [1732] 找到最高海拔
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} gain
 * @return {number}
 */
var largestAltitude = function(gain) {
  let result = 0; pre = 0;
  for (let i = 0; i < gain.length; i++) {
    pre += gain[i];
    result = Math.max(result, pre);
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// [-5,1,5,0,-7]\n
// @lcpr case=end

// @lcpr case=start
// [-4,-3,-2,-1,4,3,2]\n
// @lcpr case=end

// @lcpr case=start
// [-4]\n
// @lcpr case=end

// @lcpr case=start
// [4]\n
// @lcpr case=end
