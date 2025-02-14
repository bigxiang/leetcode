/*
 * @lc app=leetcode.cn id=1552 lang=typescript
 * @lcpr version=30204
 *
 * [1552] 两球之间的磁力
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function maxDistance(position: number[], m: number): number {
  position.sort((a, b) => a - b);
  const maxD = Math.floor((position[position.length - 1] - position[0]) / (m - 1));
  if (maxD === 1) return 1;

  let left = 1, right = maxD;
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (check(position, m, mid)) {
      left = mid + 1;
    }
    else {
      right = mid - 1;
    }
  }
  return left - 1;
};

function check(position: number[], m: number, d: number): boolean {
  let count = 1;
  let last = position[0];
  for (let i = 1; i < position.length; i++) {
    if (position[i] - last >= d) {
      last = position[i];
      count++;
    }
  }
  return count >= m;
}
// @lc code=end



// @lcpr case=start
// [1,2,3,4,7]\n3\n
// @lcpr case=end

// @lcpr case=start
// [5,4,3,2,1,1000000000]\n2\n
// @lcpr case=end

// @lcpr case=start
// [3,4,1,2,6,100]\n3\n
// @lcpr case=end

// @lcpr case=start
// [3,4,1,2,6,100]\n5\n
// @lcpr case=end

// @lcpr case=start
// [3,4]\n2\n
// @lcpr case=end

// @lcpr case=start
// [5,4,3,2,1,8,12,6,17,13,85,47,28,39,55,103,190,220,202,67,18]\n6\n
// @lcpr case=end
