/*
 * @lc app=leetcode.cn id=287 lang=javascript
 * @lcpr version=30204
 *
 * [287] 寻找重复数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var findDuplicate = function(nums) {
  const bits = Math.ceil(Math.log2(10 ** 5));
  const nBits = new Array(bits).fill(0);
  for (let i = 1; i <= nums.length - 1; i++) {
    for (let j = 0; j < bits; j++) {
      nBits[j] += (i >> j) & 1;
    }
  }

  const numsBits = new Array(bits).fill(0);
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j < bits; j++) {
      numsBits[j] += (nums[i] >> j) & 1;
    }
  }

  let result = 0;
  for (let i = 0; i < bits; i++) {
    if (numsBits[i] > nBits[i]) {
      result = result | (1 << i);
    }
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// [1,3,4,2,2]\n
// @lcpr case=end

// @lcpr case=start
// [3,1,3,4,2]\n
// @lcpr case=end

// @lcpr case=start
// [3,3,3,3,3]\n
// @lcpr case=end


