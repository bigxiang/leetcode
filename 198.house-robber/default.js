/*
 * @lc app=leetcode.cn id=198 lang=javascript
 * @lcpr version=30204
 *
 * [198] 打家劫舍
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
  if (nums.length === 1) return nums[0];

  let pre2 = 0, pre1 = nums[0];
  let curr;
  for(let i = 1; i < nums.length; i++) {
    curr = Math.max(pre1, pre2 + nums[i]);
    [pre2, pre1] = [pre1, curr];
  }
  return curr;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,1]\n
// @lcpr case=end

// @lcpr case=start
// [2,7,9,3,1]\n
// @lcpr case=end

// @lcpr case=start
// [2,7,9,3,1,3]\n
// @lcpr case=end
