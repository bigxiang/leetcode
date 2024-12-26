/*
 * @lc app=leetcode.cn id=3180 lang=javascript
 * @lcpr version=30204
 *
 * [3180] 执行操作可获得的最大总奖励 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} rewardValues
 * @return {number}
 */
var maxTotalReward = function(rewardValues) {
  rewardValues.sort((a, b) => a - b);
  const rewards = new Array(2 * rewardValues[rewardValues.length - 1] - 1).fill(0);
  rewards[0] = 1;
  for (let i = 0; i < rewardValues.length; i++) {
    if (i > 0 && rewardValues[i] === rewardValues[i - 1]) continue;

    for (let j = rewardValues[i] * 2 - 1; j >= rewardValues[i]; j--) {
      if (rewards[j - rewardValues[i]] === 1) rewards[j] = 1;
    }
  }

  for (let i = rewards.length - 1; i >= 0; i--) {
    if (rewards[i] === 1) return i;
  }
};
// @lc code=end



// @lcpr case=start
// [1,1,3,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,6,4,3,2]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end

// @lcpr case=start
// [1,10,4,2,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,10,4,2,6]\n
// @lcpr case=end

// @lcpr case=start
// [3,4,17,11]\n
// @lcpr case=end

// @lcpr case=start
// [6,13,9,19]\n
// @lcpr case=end
