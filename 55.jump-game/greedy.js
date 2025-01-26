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
  if (nums.length === 1) return true;

  let maxReach = 0, i = 0;
  while (i <= maxReach) {
    reach = i + nums[i];
    if (reach >= nums.length - 1) return true;

    maxReach = Math.max(maxReach, reach);
    i++;
  }

  return false;
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
// [0]\n
// @lcpr case=end

// @lcpr case=start
// [3,2,0,1,2,0,4,1,2,2,1,3,0,2,0]\n
// @lcpr case=end

// @lcpr case=start
// [0,2,3]\n
// @lcpr case=end
