/*
 * @lc app=leetcode.cn id=2209 lang=typescript
 * @lcpr version=30204
 *
 * [2209] 用地毯覆盖后的最少白色砖块
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function minimumWhiteTiles(floor: string, numCarpets: number, carpetLen: number): number {
  const cache = new Array(floor.length).fill(0).map(() => new Array(numCarpets + 1).fill(-1));
  return dfs(floor, numCarpets, carpetLen, 0, cache);
};

function dfs(floor: string, numCarpets: number, carpetLen: number, left: number, cache: number[][]): number {
  if (left + numCarpets * carpetLen >= floor.length) return 0;

  if (cache[left][numCarpets] !== -1) return cache[left][numCarpets];

  let result = dfs(floor, numCarpets, carpetLen, left + 1, cache) + (floor[left] === '1' ? 1 : 0);
  if (numCarpets > 0) {
    result = Math.min(
      result,
      dfs(floor, numCarpets - 1, carpetLen, left + carpetLen, cache),
    );
  }

  cache[left][numCarpets] = result;
  return result;
}
// @lc code=end



// @lcpr case=start
// "10110101"\n2\n2\n
// @lcpr case=end

// @lcpr case=start
// "11111"\n2\n3\n
// @lcpr case=end


