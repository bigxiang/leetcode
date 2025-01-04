/*
 * @lc app=leetcode.cn id=841 lang=javascript
 * @lcpr version=30204
 *
 * [841] 钥匙和房间
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} rooms
 * @return {boolean}
 */
var canVisitAllRooms = function(rooms) {
  const remaining = new Set(Array.from({ length: rooms.length}, (_, i) => i));
  const visited = new Set();

  dfs(rooms, 0, remaining, visited);

  return remaining.size === 0;
};

var dfs = function(rooms, i, remaining, visited) {
  if (visited.has(i)) return;

  visited.add(i);
  remaining.delete(i);
  for (const key of rooms[i]) {
    dfs(rooms, key, remaining, visited);
  }
}
// @lc code=end



// @lcpr case=start
// [[1],[2],[3],[]]\n
// @lcpr case=end

// @lcpr case=start
// [[1,3],[3,0,1],[2],[0]]\n
// @lcpr case=end


