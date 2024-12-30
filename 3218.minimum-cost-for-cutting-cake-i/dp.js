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
  const dp = new Array(n).fill(0)

  for (let i = 1; i < n; i++) {
    dp[i] = dp[i - 1] + verticalCut[i - 1];
  }

  let prevTop, currTopLeft;
  for (let i = 1; i < m; i++) {
    for (let j = 0; j < n; j++) {
      prevTop = dp[j];
      if (j === 0) {
        dp[j] += horizontalCut[i - 1];
      }
      else {
        dp[j] = dp[j] + dp[j - 1] - currTopLeft + Math.min(horizontalCut[i - 1], verticalCut[j - 1]);
      }
      currTopLeft = prevTop;
    }
  }

  return dp[n - 1];
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
