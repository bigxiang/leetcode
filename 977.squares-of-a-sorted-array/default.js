/*
 * @lc app=leetcode.cn id=977 lang=javascript
 * @lcpr version=30204
 *
 * [977] 有序数组的平方
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var sortedSquares = function(nums) {
  let start = 0;
  for (let i = 0; i < nums.length; i++) {
    if (i == nums.length - 1 || Math.abs(nums[i]) < Math.abs(nums[i + 1])) {
      start = i;
      break;
    }
  }

  let left = start;
  let right = left + 1;
  const result = [];
  while (left >= 0 || right < nums.length) {
    if (left < 0) {
      result.push(nums[right] * nums[right]);
      right++;
    }
    else if (right >= nums.length) {
      result.push(nums[left] * nums[left]);
      left--;
    }
    else {
      if (Math.abs(nums[left]) < Math.abs(nums[right])) {
        result.push(nums[left] * nums[left]);
        left--;
      }
      else {
        result.push(nums[right] * nums[right]);
        right++;
      }
    }
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [-4,-1,0,3,10]\n
// @lcpr case=end

// @lcpr case=start
// [-7,-3,2,3,11]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end

// @lcpr case=start
// [-4,-3,-2,-1,-1]\n
// @lcpr case=end

// @lcpr case=start
// [-4,-3,-2,-1,0]\n
// @lcpr case=end
