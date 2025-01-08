/*
 * @lc app=leetcode.cn id=1268 lang=javascript
 * @lcpr version=30204
 *
 * [1268] 搜索推荐系统
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[]} products
 * @param {string} searchWord
 * @return {string[][]}
 */
var suggestedProducts = function(products, searchWord) {
  const rootTrie = new Trie();
  for (const product of products) {
    rootTrie.insert(product);
  }

  const result = [];
  for (let i = 0; i < searchWord.length; i++) {
    result.push(rootTrie.search(searchWord.slice(0, i + 1)));
  }
  return result;
};

class Trie {
  constructor() {
    this.children = new Map();
    this.words = [];
  }

  insert(word) {
    if (!word) return;

    let node = this;
    for (let i = 0; i < word.length; i++) {
      if (!node.children.has(word[i])) {
        node.children.set(word[i], new Trie());
      }
      node = node.children.get(word[i]);
      node.words.push(word);
      node.words.sort();
      if (node.words.length > 3) node.words.pop();
    }
  }

  search(prefix) {
    let node = this;
    for (let i = 0; i < prefix.length; i++) {
      if (!node.children.has(prefix[i])) return [];
      node = node.children.get(prefix[i]);
    }
    return node.words;
  }
}
// @lc code=end



// @lcpr case=start
// ["mobile","mouse","moneypot","monitor","mousepad"]\n"mouse"\n
// @lcpr case=end

// @lcpr case=start
// ["havana"]\n"havana"\n
// @lcpr case=end

// @lcpr case=start
// ["bags","baggage","banner","box","cloths"]\n"bags"\n
// @lcpr case=end

// @lcpr case=start
// ["havana"]\n"tatiana"\n
// @lcpr case=end


