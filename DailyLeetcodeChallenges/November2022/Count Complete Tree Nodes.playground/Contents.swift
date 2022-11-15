import UIKit
/*
 222. Count Complete Tree Nodes
 Given the root of a complete binary tree, return the number of the nodes in the tree.

 According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Design an algorithm that runs in less than O(n) time complexity.
 
 Example 1:
 
 Input: root = [1,2,3,4,5,6]
 Output: 6

 Example 2:

 Input: root = []
 Output: 0

 Example 3:

 Input: root = [1]
 Output: 1

 */
//Definition for a binary tree node.

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
    var counter = 0
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        inorderTraversal(root)
        return counter
    }
    
    private func inorderTraversal(_ node : TreeNode?){
        guard let node = node else { return }
        inorderTraversal(node.left)
        counter += 1
        inorderTraversal(node.right)
        
    }
}

//Shorter Solution
class Solution2 {
    func countNodes(_ root: TreeNode?) -> Int {
      if let root = root { return 1 + countNodes(root.left) + countNodes(root.right) }
      return 0
    }
}

//Faster solution
/*
         0        - level 0: 2^0
       /   \
      1     2     - level 1: 2^1
     / \   / \
    3   4 5   6   - level 2: 2^2    sum(level0...k-1): 2^k - 1
    ... n         - level k: 2^k
        ^: h = log2(n)

    get depth
    count the number in last level
    use binaray search to find the latest index of last level

    level K: numOfK / 2 until 1 -> level: 0

        
 */
class Solution3 {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        // print(root.node(at: 0, level: 0)?.val)
        // print(root.node(at: 0, level: 1)?.val)
        // print(root.node(at: 1, level: 1)?.val)
        // print(root.node(at: 0, level: 2)?.val)
        // print(root.node(at: 1, level: 2)?.val)
        // print(root.node(at: 2, level: 2)?.val)
        // print(root.node(at: 3, level: 2)?.val)
        let depth = root.depth
        let count = TreeNode.countOfLevel(depth)
        let n = latestIndexOfTree(root, 0, count-1, height: depth)
        // print("n \(n)")
        return count + n // count - 1 + n + 1
        
        // return root.count
    }
    
    func latestIndexOfTree(_ node: TreeNode, _ l: Int, _ r: Int, height: Int) -> Int {
        guard l <= r else {
            if r < l {
                // 0 1 -> 0 1
                // t        ^
                return l - 1
            } else {
                // 0 1 -> 0 1
                //   f    ^
                return l
            }
        }
        let mid = l + (r-l)/2
        if node.node(at: mid, level: height) != nil {
            return latestIndexOfTree(node, mid+1, r, height: height)
        } else {
            return latestIndexOfTree(node, l, mid-1, height: height)
        }
    }
}

extension TreeNode {
    static func countOfLevel(_ level: Int) -> Int {
        guard level >= 0 else {
            return 0
        }
        return (pow(2, level) as NSDecimalNumber).intValue
    }
    
    func node(at index: Int, level: Int) -> TreeNode? {
        guard level > 0 else {
            return index == 0 ? self : nil
        }
        let count = TreeNode.countOfLevel(level)
        guard index < count else {
            return nil
        }
        let mid = count / 2
        if index < count / 2 {
            return left?.node(at: index, level: level - 1)
        } else {
            return right?.node(at: index - mid, level: level - 1)
        }
    }
    
    var depth: Int {
        (left?.depth ?? -1) + 1
    }
    
    var count: Int {
        (left?.count ?? 0) + (right?.count ?? 0) + 1
    }
}
