/*
 * @lc app=leetcode.cn id=1004 lang=javascript
 * @lcpr version=30204
 *
 * [1004] 最大连续1的个数 III
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var longestOnes = function(nums, k) {
  let left = 0, right = 0;
  let maxLength = 0;
  let flipLeft = k;
  while (right < nums.length) {
    if (nums[right] === 0) {
      if (flipLeft > 0) {
        flipLeft--;
        right++;
      } else {
        maxLength = Math.max(maxLength, right - left);
        if (nums[left] === 0) {
          flipLeft++;
        }
        left++;
      }
    } else {
      right++;
    }
  }
  maxLength = Math.max(maxLength, right - left);
  return maxLength;
};
// @lc code=end



// @lcpr case=start
// [1,1,1,0,0,0,1,1,1,1,0]\n2\n
// @lcpr case=end

// @lcpr case=start
// [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]\n3\n
// @lcpr case=end

// @lcpr case=start
// [0,0,1]\n3\n
// @lcpr case=end


