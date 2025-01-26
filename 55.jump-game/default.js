/*
 * @lc app=leetcode.cn id=55 lang=javascript
 * @lcpr version=30204
 *
 * [55] 跳跃游戏
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
  const dp = new Array(nums.length).fill(false);
  dp[dp.length - 1] = true;

  for (let i = nums.length - 2; i >= 0; i--) {
    let j = i + 1;
    while (j <= i + nums[i]) {
      if (j >= nums.length || dp[j]) {
        dp[i] = true;
        break;
      }
      j++;
    }
  }

  return dp[0];
};
// @lc code=end



// @lcpr case=start
// [2,3,1,1,4]\n
// @lcpr case=end

// @lcpr case=start
// [3,2,1,0,4]\n
// @lcpr case=end

// @lcpr case=start
// [3]\n
// @lcpr case=end

// @lcpr case=start
// [3,2,0,1,2,0,4,1,2,2,1,3,0,2,0]\n
// @lcpr case=end
