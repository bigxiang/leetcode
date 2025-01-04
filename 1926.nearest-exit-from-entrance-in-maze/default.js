/*
 * @lc app=leetcode.cn id=1926 lang=javascript
 * @lcpr version=30204
 *
 * [1926] 迷宫中离入口最近的出口
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {character[][]} maze
 * @param {number[]} entrance
 * @return {number}
 */
var nearestExit = function(maze, entrance) {
  const queue = [entrance];
  let queue_i = 0;
  let step = 0;
  while (queue_i < queue.length) {
    let currStepLength = queue.length - queue_i;
    let currStepIndex = queue_i + currStepLength;
    while (queue_i < currStepIndex) {
      const [i, j] = queue[queue_i++];

      if (i < 0 || j < 0 || i >= maze.length || j >= maze[0].length) {
        if (step > 1) return step - 1;
        else continue;
      }

      if (maze[i][j] === '+') continue;
      maze[i][j] = '+';

      [[0, 1], [0, -1], [1, 0], [-1, 0]].forEach(([di, dj]) => {
        queue.push([i + di, j + dj]);
      })
    }
    step++;
  }

  return -1;
};
// @lc code=end



// @lcpr case=start
// [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]]\n[1,2]\n
// @lcpr case=end

// @lcpr case=start
// [["+","+","+"],[".",".","."],["+","+","+"]]\n[1,0]\n
// @lcpr case=end

// @lcpr case=start
// [[".","+"]]\n[0,0]\n
// @lcpr case=end


