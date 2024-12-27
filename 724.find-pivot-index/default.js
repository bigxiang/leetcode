/*
 * @lc app=leetcode.cn id=724 lang=javascript
 * @lcpr version=30204
 *
 * [724] 寻找数组的中心下标
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var pivotIndex = function(nums) {
  const leftPre = new Array(nums.length).fill(0);
  const rightPre = new Array(nums.length).fill(0);

  for (let i = 1; i < nums.length; i++) {
    leftPre[i] = leftPre[i - 1] + nums[i - 1];
  }

  for (let i = nums.length - 2; i >= 0; i--) {
    rightPre[i] = rightPre[i + 1] + nums[i + 1];
  }

  for (let i = 0; i < nums.length; i++) {
    if (leftPre[i] === rightPre[i]) return i;
  }

  return -1;
};
// @lc code=end



// @lcpr case=start
// [1, 7, 3, 6, 5, 6]\n
// @lcpr case=end

// @lcpr case=start
// [1, 2, 3]\n
// @lcpr case=end

// @lcpr case=start
// [2, 1, -1]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end
