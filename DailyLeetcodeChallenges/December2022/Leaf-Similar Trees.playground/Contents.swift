/*
 872. Leaf-Similar Trees

 Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a leaf value sequence.
 
 For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).

 Two binary trees are considered leaf-similar if their leaf value sequence is the same.

 Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
 
 Example 1:
 
 Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
 Output: true
 
 Example 2:
 Input: root1 = [1,2,3], root2 = [1,3,2]
 Output: false
 
 Constraints:

     The number of nodes in each tree will be in the range [1, 200].
     Both of the given trees will have values in the range [0, 200].

 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return dfs(root1) == dfs(root2)
    }
    private func dfs(_ node: TreeNode?) -> [Int] {
        guard let node = node else {return []}
        if node.left == nil && node.right == nil {
            return [node.val]
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        return left + right
    }
}





//Using Leaf Iterator[Self defined class]
//fastest solution
class LeafIterator {
    private var nodes: [TreeNode] = []
    init(_ root: TreeNode?) {
        guard let root = root else { return }
        putNodeAndLefts(root)
    }

    func next() -> Int? {
        while true {
            guard let n = nextNode() else { return nil }
            if n.left == nil && n.right == nil { return n.val }
        }
    }

    private func nextNode() -> TreeNode? {
        guard let last = nodes.popLast() else { return nil }
        last.right.flatMap { putNodeAndLefts($0) }
        return last
    }

    private func putNodeAndLefts(_ root: TreeNode) {
        nodes.append(root)
        var node = root
        while true {
            guard let left = node.left else { break }
            nodes.append(left)
            node = left
        }
    }
}

class Solution2 {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        let it1 = LeafIterator(root1)
        let it2 = LeafIterator(root2)
        while true {
            let n1 = it1.next()
            let n2 = it2.next()
            if n1 != n2 { return false }
            if n1 == nil { break }
        }
        return true
    }
}


