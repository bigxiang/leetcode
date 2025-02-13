/*
 * @lc app=leetcode.cn id=922 lang=typescript
 * @lcpr version=30204
 *
 * [922] 按奇偶排序数组 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function sortArrayByParityII(nums: number[]): number[] {
  let oddIndex: number = 1;
  for (let evenIndex: number = 0; evenIndex < nums.length; evenIndex += 2) {
    while (nums[evenIndex] % 2 !== 0) {
      [nums[evenIndex], nums[oddIndex]] = [nums[oddIndex], nums[evenIndex]];
      oddIndex += 2;
    }
  }

  return nums;
};
// @lc code=end



// @lcpr case=start
// [4,2,5,7]\n
// @lcpr case=end

// @lcpr case=start
// [2,3]\n
// @lcpr case=end

// @lcpr case=start
// [2,3,1,3,5,2,4,6]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5,6,7,8]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,2,3,4,5,6,8]\n
// @lcpr case=end
