/*
 * @lc app=leetcode.cn id=27 lang=javascript
 * @lcpr version=30204
 *
 * [27] 移除元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} val
 * @return {number}
 */
var removeElement = function(nums, val) {
  let valPos = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] != val) {
      nums[valPos++] = nums[i];
    }
  }
  return valPos;
};
// @lc code=end



// @lcpr case=start
// [3,2,2,3]\n3\n
// @lcpr case=end

// @lcpr case=start
// [0,1,2,2,3,0,4,2]\n2\n
// @lcpr case=end

// @lcpr case=start
// []\n2\n
// @lcpr case=end

// @lcpr case=start
// [3]\n2\n
// @lcpr case=end

// @lcpr case=start
// [2]\n2\n
// @lcpr case=end



