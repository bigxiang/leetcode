/*
 * @lc app=leetcode.cn id=215 lang=javascript
 * @lcpr version=30204
 *
 * [215] 数组中的第K个最大元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
  const comFn = (a, b) => a < b;
  const minHeap = new Heap(comFn);
  for (num of nums) minHeap.add(num);
  for (let i = 0; i < k - 1; i++) minHeap.pop();

  return minHeap.top();
};

class Heap {
  constructor(comFn) {
    this.data = [0];
    this.comFn = comFn;
  }

  top() {
    return this.data[1];
  }

  add(val) {
    this.data.push(val);
    this.heapifyUp(this.data.length - 1);
  }

  pop() {
    if (this.data.length === 1) return;

    if (this.data.length === 2) {
      return this.data.pop();
    }

    const popped = this.data[1];
    this.data[1] = this.data.pop();
    this.heapifyDown(1);

    return popped;
  }

  heapifyUp(index) {
    if (index === 1) return;

    const parentIndex = index >> 1;
    if (this.comFn(this.data[parentIndex], this.data[index])) {
      [this.data[parentIndex], this.data[index]] = [this.data[index], this.data[parentIndex]];
      this.heapifyUp(parentIndex);
    }
  }

  heapifyDown(index) {
    const leftIndex = index * 2;
    const rightIndex = index * 2 + 1;
    if (leftIndex >= this.data.length) return;
    if (rightIndex >= this.data.length) {
      if (this.comFn(this.data[index], this.data[leftIndex])) {
        [this.data[index], this.data[leftIndex]] = [this.data[leftIndex], this.data[index]];
      }
    }
    else {
      const targetIndex = this.comFn(this.data[leftIndex], this.data[rightIndex]) ? rightIndex : leftIndex;
      if (this.comFn(this.data[index], this.data[targetIndex])) {
        [this.data[index], this.data[targetIndex]] = [this.data[targetIndex], this.data[index]];
        this.heapifyDown(targetIndex);
      }
    }
  }
}
// @lc code=end



// @lcpr case=start
// [3,2,1,5,6,4]\n2\n
// @lcpr case=end

// @lcpr case=start
// [3,2,3,1,2,4,5,5,6]\n4\n
// @lcpr case=end

// @lcpr case=start
// [3]\n1\n
// @lcpr case=end

// @lcpr case=start
// [3,2,4]\n1\n
// @lcpr case=end
