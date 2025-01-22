/*
 * @lc app=leetcode.cn id=973 lang=javascript
 * @lcpr version=30204
 *
 * [973] 最接近原点的 K 个点
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[][]} points
 * @param {number} k
 * @return {number[][]}
 */
var kClosest = function(points, k) {
  const result = [];
  const minHeap = new Heap((a, b) => a.distance > b.distance);
  for (let i = 0; i < points.length; i++) {
    const point = points[i];
    const [x, y] = point;
    const distance = x * x + y * y;
    minHeap.push({ distance, point });
  }

  for (let i = 0; i < k; i++) {
    result.push(minHeap.pop().point);
  }

  return result;
};

class Heap {
  constructor(comFn) {
    this.data = [0];
    this.comFn = comFn;
  }

  top() {
    return this.data[1];
  }

  push(val) {
    this.data.push(val);
    this.heapifyUp(this.data.length - 1);
  }

  heapifyUp(index) {
    if (index === 1) return;

    const parentIndex = Math.floor(index / 2);
    if (this.comFn(this.data[parentIndex], this.data[index])) {
      [this.data[index], this.data[parentIndex]] = [this.data[parentIndex], this.data[index]];
      this.heapifyUp(parentIndex);
    }
  }

  pop() {
    if (this.data.length === 1) return;
    if (this.data.length === 2) return this.data.pop();

    const popped = this.data[1];
    this.data[1] = this.data.pop();
    this.heapifyDown(1);
    return popped;
  }

  heapifyDown(index) {
    const leftIndex = index * 2;
    const rightIndex = index * 2 + 1;

    if (leftIndex >= this.data.length) return;

    let targetIndex = index;
    if (this.comFn(this.data[targetIndex], this.data[leftIndex])) {
      targetIndex = leftIndex;
    }

    if (rightIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[rightIndex])) {
      targetIndex = rightIndex;
    }

    if (targetIndex === index) return;

    [this.data[index], this.data[targetIndex]] = [this.data[targetIndex], this.data[index]];
    this.heapifyDown(targetIndex);
  }
}
// @lc code=end



// @lcpr case=start
// [[1,3],[-2,2]]\n1\n
// @lcpr case=end

// @lcpr case=start
// [[3,3],[5,-1],[-2,4]]\n2\n
// @lcpr case=end


