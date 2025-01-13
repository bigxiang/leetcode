#
# @lc app=leetcode.cn id=863 lang=ruby
# @lcpr version=30204
#
# [863] 二叉树中所有距离为 K 的结点
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}
def distance_k(root, target, k)
  graph = {}

  dfs(root, root.left, graph)
  dfs(root, root.right, graph)

  queue = [target]
  visited = Set.new
  while queue.any? && k > 0
    curr_queue = queue.dup
    queue = []
    curr_queue.each do |node|
      visited.add(node)

      (graph[node] || []).each do |neighbor|
        queue << neighbor unless visited.include?(neighbor)
      end
    end

    k -= 1
  end
  queue.map(&:val)
end

def dfs(parent, node, graph)
  return if node.nil?

  graph[parent] ||= []
  graph[parent] << node

  graph[node] ||= []
  graph[node] << parent

  dfs(node, node.left, graph)
  dfs(node, node.right, graph)
end
# @lc code=end

#
# @lcpr case=start
# [3,5,1,6,2,0,8,null,null,7,4]\n5\n2\n
# @lcpr case=end

# @lcpr case=start
# [1]\n1\n3\n
# @lcpr case=end

# @lcpr case=start
# [1]\n1\n0\n
# @lcpr case=end
#
