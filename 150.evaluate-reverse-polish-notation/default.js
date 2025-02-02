/*
 * @lc app=leetcode.cn id=150 lang=javascript
 * @lcpr version=30204
 *
 * [150] 逆波兰表达式求值
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[]} tokens
 * @return {number}
 */
var evalRPN = function(tokens) {
  const stack = [];
  for (const token of tokens) {
    switch (token) {
      case '+':
        stack.push(stack.pop() + stack.pop());
        break;
      case '-':
        stack.push(-stack.pop() + stack.pop());
        break;
      case '*':
        stack.push(stack.pop() * stack.pop());
        break;
      case '/':
        const num2 = stack.pop();
        const num1 = stack.pop();
        let quotient = num1 / num2;
        if (quotient < 0) quotient = Math.ceil(quotient);
        else quotient = Math.floor(quotient);
        stack.push(quotient);
        break;
      default:
        stack.push(Number(token));
    }
  }
  return stack[0];
};
// @lc code=end



// @lcpr case=start
// ["2","1","+","3","*"]\n
// @lcpr case=end

// @lcpr case=start
// ["4","13","5","/","+"]\n
// @lcpr case=end

// @lcpr case=start
// ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]\n
// @lcpr case=end


