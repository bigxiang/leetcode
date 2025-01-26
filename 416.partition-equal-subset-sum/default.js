/*
 * @lc app=leetcode.cn id=416 lang=javascript
 * @lcpr version=30204
 *
 * [416] 分割等和子集
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
  if (nums.length === 1) return false;

  const sum = nums.reduce((acc, cur) => acc + cur, 0);
  if (sum % 2 !== 0) return false;

  const dp = new Array(sum + 1).fill(false);
  dp[0] = true;
  dp[nums[0]] = true;
  for (let i = 1; i < nums.length; i++) {
    for (let j = sum; j >= 0; j--) {
      if (j < nums[i]) continue;

      dp[j] = dp[j] || dp[j - nums[i]];
    }

    if (dp[sum / 2]) return true;
  }

  return false;
};
// @lc code=end



// @lcpr case=start
// [1,5,11,5]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,5]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end

// @lcpr case=start
// [2,6,4]\n
// @lcpr case=end

// @lcpr case=start
// [2,6,4,8,10,12,14,16,18,20,2,2,2,4,20]\n
// @lcpr case=end
