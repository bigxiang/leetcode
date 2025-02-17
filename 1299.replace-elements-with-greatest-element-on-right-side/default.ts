/*
 * @lc app=leetcode.cn id=1299 lang=typescript
 * @lcpr version=30204
 *
 * [1299] 将每个元素替换为右侧最大元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function replaceElements(arr: number[]): number[] {
  const maxArr = new Array(arr.length).fill(0);
  maxArr[arr.length - 1] = -1;

  for (let i = arr.length - 2; i >= 0; i--) {
    maxArr[i] = Math.max(maxArr[i + 1], arr[i + 1]);
  }

  return maxArr;
};
// @lc code=end



// @lcpr case=start
// [17,18,5,4,6,1]\n
// @lcpr case=end

// @lcpr case=start
// [400]\n
// @lcpr case=end


