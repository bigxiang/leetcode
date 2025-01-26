/*
 * @lc app=leetcode.cn id=300 lang=javascript
 * @lcpr version=30204
 *
 * [300] 最长递增子序列
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function(nums) {
  const dp = [];

  for (const num of nums) {
    insertToDp(dp, num);
  }

  return dp.length;
};

var insertToDp = function(dp, num) {
  if (dp.length === 0 || dp[dp.length - 1] < num) {
    dp.push(num);
    return;
  }

  if (dp[0] >= num) {
    dp[0] = num;
    return;
  }

  let left = 0, right = dp.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);

    if (dp[mid] === num) return;

    if (dp[mid] > num) right = mid;
    else left = mid + 1;
  }

  dp[left] = num;
}
// @lc code=end



// @lcpr case=start
// [10,9,2,5,3,7,101,18]\n
// @lcpr case=end

// @lcpr case=start
// [0,1,0,3,2,3]\n
// @lcpr case=end

// @lcpr case=start
// [7,7,7,7,7,7,7]\n
// @lcpr case=end

// @lcpr case=start
// [5]\n
// @lcpr case=end

// @lcpr case=start
// [5,-2,3,-4,-3,1,6,7,6,3,2,0,4,2,6,3,8]\n
// @lcpr case=end
