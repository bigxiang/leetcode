/*
 * @lc app=leetcode.cn id=1706 lang=typescript
 * @lcpr version=30204
 *
 * [1706] 球会落何处
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function findBall(grid: number[][]): number[] {
  const result = new Array(grid[0].length).fill(-1);
  for (let i = 0; i < result.length; i++) {
    let j = i;
    let success = true;
    for (let row = 0; row < grid.length; row++) {
      if (j === 0 && grid[row][j] === -1 || j === grid[row].length - 1 && grid[row][j] === 1 || grid[row][j] === 1 && grid[row][j + 1] === -1 || grid[row][j] === -1 && grid[row][j - 1] === 1) {
        success = false;
        break;
      }
      if (grid[row][j] === 1) j++;
      else j--;
    }
    if (success) result[i] = j;
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// [[1,1,1,-1,-1],[1,1,1,-1,-1],[-1,-1,-1,1,1],[1,1,1,1,-1],[-1,-1,-1,-1,-1]]\n
// @lcpr case=end

// @lcpr case=start
// [[-1]]\n
// @lcpr case=end

// @lcpr case=start
// [[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1],[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1]]\n
// @lcpr case=end


