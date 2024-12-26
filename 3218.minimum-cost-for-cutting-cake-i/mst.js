/*
 * @lc app=leetcode.cn id=3218 lang=javascript
 * @lcpr version=30204
 *
 * [3218] 切蛋糕的最小总开销 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} m
 * @param {number} n
 * @param {number[]} horizontalCut
 * @param {number[]} verticalCut
 * @return {number}
 */
var minimumCost = function(m, n, horizontalCut, verticalCut) {
  horizontalCut.sort((a, b) => a - b);
  verticalCut.sort((a, b) => a - b);
  let i = 0, j = 0, result = 0;
  while (i < m - 1 || j < n - 1) {
    if (i < m - 1 && (j == n - 1 || horizontalCut[i] <= verticalCut[j])) {
      result += horizontalCut[i] * (n - j);
      i++;
    }

    if (j < n - 1 && (i == m - 1 || verticalCut[j] < horizontalCut[i])) {
      result += verticalCut[j] * (m - i);
      j++;
    }
  }
  return result;
};

// @lc code=end



// @lcpr case=start
// 3\n2\n[1,3]\n[5]\n
// @lcpr case=end

// @lcpr case=start
// 2\n2\n[7]\n[4]\n
// @lcpr case=end


// @lcpr case=start
// 1\n1\n[]\n[]\n
// @lcpr case=end

// @lcpr case=start
// 3\n2\n[1,3]\n[2]\n
// @lcpr case=end

// @lcpr case=start
// 2\n3\n[2]\n[1,3]\n
// @lcpr case=end

// @lcpr case=start
// 2\n4\n[4]\n[1,5,2]\n
// @lcpr case=end

// @lcpr case=start
// 3\n2\n[2,2]\n[2]\n
// @lcpr case=end

// @lcpr case=start
// 7\n4\n[13,6,12,14,4,7]\n[14,15,11]\n
// @lcpr case=end

