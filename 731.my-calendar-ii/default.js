/*
 * @lc app=leetcode.cn id=731 lang=javascript
 * @lcpr version=30204
 *
 * [731] 我的日程安排表 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var MyCalendarTwo = function() {
  this.data = new SegmentTree(0, 1e9);
};

/**
 * @param {number} startTime
 * @param {number} endTime
 * @return {boolean}
 */
MyCalendarTwo.prototype.book = function(startTime, endTime) {
  if (this.data.query(startTime, endTime - 1) === 2) return false;

  this.data.update(startTime, endTime - 1, 1);
  return true;
};

class SegmentTree {
  constructor(start, end) {
    this.start = start;
    this.end = end;
    this.root = new Node();
  }

  query(l, r) {
    return this.root.query(this.root, this.start, this.end, l, r);
  }

  update(l, r, val) {
    this.root.update(this.root, this.start, this.end, l, r, val);
  }
}

class Node {
  constructor() {
    this.val = 0;
    this.lazy = 0;
    this.left = null;
    this.right = null;
  }

  query(node, start, end, l, r) {
    if (l <= start && end <= r) return node.val;

    const mid = start + ((end - start) >> 1);

    this.pushDown(node, start, mid, end);

    let result = 0;
    if (l <= mid) result = this.query(node.left, start, mid, l, r);
    if (mid < r) result = Math.max(result, this.query(node.right, mid + 1, end, l, r));

    return result;
  }

  update(node, start, end, l, r, val) {
    if (l <= start && end <= r) {
      node.val += val;
      node.lazy += val;
      return;
    }

    const mid = start + ((end - start) >> 1);

    this.pushDown(node, start, mid, end);

    if (l <= mid) this.update(node.left, start, mid, l, r, val);
    if (mid < r) this.update(node.right, mid + 1, end, l, r, val);

    this.pushUp(node);
  }

  pushDown(node, start, mid, end) {
    if (!node.left) node.left = new Node();
    if (!node.right) node.right = new Node();
    if (node.lazy === 0) return;

    node.left.val += node.lazy;
    node.left.lazy += node.lazy;

    node.right.val += node.lazy;
    node.right.lazy += node.lazy;

    node.lazy = 0;
  }

  pushUp(node) {
    node.val = Math.max(node.left.val, node.right.val);
  }
}


/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * var obj = new MyCalendarTwo()
 * var param_1 = obj.book(startTime,endTime)
 */
// @lc code=end



// @lcpr case=start
// ["MyCalendarTwo", "book", "book", "book", "book", "book", "book"]\n[[], [10, 20], [50, 60], [10, 40], [5, 15], [5, 10], [25, 55]]\n
// @lcpr case=end


