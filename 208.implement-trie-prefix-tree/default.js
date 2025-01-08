/*
 * @lc app=leetcode.cn id=208 lang=javascript
 * @lcpr version=30204
 *
 * [208] 实现 Trie (前缀树)
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var Trie = function() {
  this.data = [new Map(), false];
};

/**
 * @param {string} word
 * @return {void}
 */
Trie.prototype.insert = function(word) {
  let char = this.data;
  for (let i = 0; i < word.length; i++) {
    if (!char[0].has(word[i])) char[0].set(word[i], [new Map(), false]);
    char = char[0].get(word[i]);
  }
  char[1] = true;
};

/**
 * @param {string} word
 * @return {boolean}
 */
Trie.prototype.search = function(word) {
  let char = this.data;
  for (let i = 0; i < word.length; i++) {
    if (!char[0].has(word[i])) return false;
    char = char[0].get(word[i]);
  }
  return char[1];
};

/**
 * @param {string} prefix
 * @return {boolean}
 */
Trie.prototype.startsWith = function(prefix) {
  let char = this.data;
  for (let i = 0; i < prefix.length; i++) {
    if (!char[0].has(prefix[i])) return false;
    char = char[0].get(prefix[i]);
  }
  return true;
};

/**
 * Your Trie object will be instantiated and called as such:
 * var obj = new Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */
// @lc code=end

// @lcpr case=start
// ["Trie","insert","search","startsWith"]\n[[],["apple"],["apple"],["apple"]]\n
// @lcpr case=end

// @lcpr case=start
// ["Trie","insert","search","insert", "search"]\n[[],["apple"],["apple"],["app"],["app"]]\n
// @lcpr case=end

// @lcpr case=start
// ["Trie","insert","search","insert", "search","startsWith"]\n[[],["apple"],["apple"],["app"],["app"],["app"]]\n
// @lcpr case=end
