/*
 * @lc app=leetcode.cn id=2274 lang=javascript
 * @lcpr version=30204
 *
 * [2274] 不含特殊楼层的最大连续楼层数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} bottom
 * @param {number} top
 * @param {number[]} special
 * @return {number}
 */
var maxConsecutive = function(bottom, top, special) {
  special.sort((a, b) => a - b);
  let max = special[0] - bottom;
  for (let i = 1; i < special.length; i++) {
    max = Math.max(max, special[i] - special[i-1] - 1);
  }
  max = Math.max(max, top - special[special.length-1]);
  return max;
};
// @lc code=end



// @lcpr case=start
// 2\n9\n[4,6]\n
// @lcpr case=end

// @lcpr case=start
// 6\n8\n[7,6,8]\n
// @lcpr case=end


