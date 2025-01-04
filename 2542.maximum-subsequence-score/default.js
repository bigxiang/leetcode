/*
 * @lc app=leetcode.cn id=2542 lang=javascript
 * @lcpr version=30204
 *
 * [2542] 最大子序列的分数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @param {number} k
 * @return {number}
 */
var maxScore = function(nums1, nums2, k) {
  const nums1Heap = new Heap((a, b) => a > b);
  const n = nums1.length;
  const ids = Array.from({ length: n }, (_, i) => i);
  ids.sort((a, b) => nums2[b] - nums2[a]);

  let sum = 0;
  for (let i = 0; i < k; i++) {
    sum += nums1[ids[i]];
    nums1Heap.add(nums1[ids[i]]);
  }
  let maxScore = sum * nums2[ids[k-1]];

  for (let i = k; i < n; i++) {
    if (nums1Heap.top() < nums1[ids[i]]) {
      sum -= nums1Heap.pop();
      nums1Heap.add(nums1[ids[i]]);
      sum += nums1[ids[i]];

      maxScore = Math.max(maxScore, sum * nums2[ids[i]]);
    }
  }

  return maxScore;
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

  heapifyUp(index) {
    if (index === 1) return;

    const parentIndex = index >> 1;
    if (this.comFn(this.data[parentIndex], this.data[index])) {
      [this.data[parentIndex], this.data[index]] = [this.data[index], this.data[parentIndex]];
      this.heapifyUp(parentIndex);
    }
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

  heapifyDown(index) {
    const leftIndex = index * 2;
    const rightIndex = index * 2 + 1;
    let targetIndex = index;

    if (leftIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[leftIndex])) {
      targetIndex = leftIndex;
    }

    if (rightIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[rightIndex])) {
      targetIndex = rightIndex;
    }

    if (targetIndex !== index) {
      [this.data[targetIndex], this.data[index]] = [this.data[index], this.data[targetIndex]];
      this.heapifyDown(targetIndex);
    }
  }
}
// @lc code=end



// @lcpr case=start
// [1,3,3,2]\n[2,1,3,4]\n3\n
// @lcpr case=end

// @lcpr case=start
// [4,2,3,1,1]\n[7,5,10,9,6]\n1\n
// @lcpr case=end


// @lcpr case=start
// [2,1,14,12]\n[11,7,13,6]\n3
// @lcpr case=end

// @lcpr case=start
// [1,2,14,12]\n[11,7,13,6]\n3
// @lcpr case=end
