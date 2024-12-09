/*
 * @lc app=leetcode.cn id=11 lang=javascript
 * @lcpr version=30204
 *
 * [11] 盛最多水的容器
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea = function(height) {
  let left = 0;
  let right = height.length - 1;
  let maxVolume = 0;
  while (left < right) {
    let volume = Math.min(height[left], height[right]) * (right - left);
    maxVolume = Math.max(maxVolume, volume);
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return maxVolume;
};
// @lc code=end



// @lcpr case=start
// [1,8,6,2,5,4,8,3,7]\n
// @lcpr case=end

// @lcpr case=start
// [1,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,8,6,2,5,4,5,6,7,10,2,3,6,8,15,4,2,1,3,5,5,5,7,8,20,8,3,7]\n
// @lcpr case=end


