/*
 * @lc app=leetcode.cn id=45 lang=javascript
 * @lcpr version=30204
 *
 * [45] 跳跃游戏 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var jump = function(nums) {
  let farthest = 0;
  let i = 0;
  let step = 0;
  while (farthest < nums.length - 1) {
    let nextFarthest = 0;
    while (i <= farthest) {
      nextFarthest = Math.max(nextFarthest, i + nums[i]);
      i++;
    }
    farthest = nextFarthest;
    step++;
  }

  return step;
};
// @lc code=end



// @lcpr case=start
// [2,3,1,1,4]\n
// @lcpr case=end

// @lcpr case=start
// [2,3,0,1,4]\n
// @lcpr case=end

// @lcpr case=start
// [2,6,0,1,1,3,3,4,0]\n
// @lcpr case=end


