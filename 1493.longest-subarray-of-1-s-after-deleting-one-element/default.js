/*
 * @lc app=leetcode.cn id=1493 lang=javascript
 * @lcpr version=30204
 *
 * [1493] 删掉一个元素以后全为 1 的最长子数组
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var longestSubarray = function(nums) {
  let result = 0;
  let left = 0, right = 0;
  let deleted = false;
  let zeroPos = 0;
  while (right <= nums.length) {
    if (nums[right] === 1) {
      right++;
    }
    else if (deleted || right == nums.length) {
      result = Math.max(result, right - left - 1)
      left = zeroPos + 1;
      zeroPos = right;
      right++;
    }
    else {
      deleted = true;
      zeroPos = right;
      right++;
    }
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [1,1,0,1]\n
// @lcpr case=end

// @lcpr case=start
// [0,1,1,1,0,1,1,0,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1]\n
// @lcpr case=end

// @lcpr case=start
// [0,0]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end

// @lcpr case=start
// [0]\n
// @lcpr case=end
