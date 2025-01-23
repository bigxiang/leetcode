/*
 * @lc app=leetcode.cn id=658 lang=javascript
 * @lcpr version=30204
 *
 * [658] 找到 K 个最接近的元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} arr
 * @param {number} k
 * @param {number} x
 * @return {number[]}
 */
var findClosestElements = function(arr, k, x) {
  const minIndex = findMinDistanceIndex(arr, x);

  const result = [];
  let left = minIndex, right = minIndex + 1;
  while (left >= 0 || right < arr.length) {
    if (right === arr.length || Math.abs(arr[left] - x) <= Math.abs(arr[right] - x)) {
      result.push(arr[left--]);
    }
    else result.push(arr[right++]);

    if (result.length === k) return result.sort((a, b) => a - b);
  }
};

var findMinDistanceIndex = function(arr, x) {
  if (arr[0] >= x) return 0;
  if (arr[arr.length - 1] <= x) return arr.length - 1;

  let left = 0, right = arr.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);

    if (arr[mid] < x) {
      left = mid + 1;
    }
    else {
      right = mid;
    }
  }

  if (Math.abs(arr[left - 1] - x) <= Math.abs(arr[left] - x)) return left - 1;
  else return left;
}
// @lc code=end



// @lcpr case=start
// [1,2,3,4,5]\n4\n3\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5]\n5\n3\n
// @lcpr case=end

// @lcpr case=start
// [1,1,2,3,4,5]\n4\n-1\n
// @lcpr case=end

// @lcpr case=start
// [-6,-5,-4,-3,-2,-2,0,0,1,1,2,3,4,5]\n4\n-1\n
// @lcpr case=end


// @lcpr case=start
// [1,1,2,2,2,2,2,3,3]\n3\n3\n
// @lcpr case=end

// @lcpr case=start
// [1,4]\n1\n3\n
// @lcpr case=end

// @lcpr case=start
// [1,4]\n1\n2\n
// @lcpr case=end
