/*
 * @lc app=leetcode.cn id=692 lang=javascript
 * @lcpr version=30204
 *
 * [692] 前K个高频单词
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[]} words
 * @param {number} k
 * @return {string[]}
 */
var topKFrequent = function(words, k) {
  const wordCount = new Map();
  for (const word of words) {
    wordCount.set(word, (wordCount.get(word) || 0) + 1);
  }

  const minHeap = new Heap((a, b) => a.count < b.count || a.count === b.count && a.word > b.word);
  for (const [word, count] of wordCount) {
    minHeap.push({word, count});
  }

  const result = [];
  for (let i = 0; i < k; i++) {
    result.push(minHeap.pop().word);
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
// ["i", "love", "leetcode", "i", "love", "coding"]\n2\n
// @lcpr case=end

// @lcpr case=start
// ["the","day","is","sunny","the","the","the","sunny","is","is"]\n4\n
// @lcpr case=end


