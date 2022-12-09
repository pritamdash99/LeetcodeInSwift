/*
 1026. Maximum Difference Between Node and Ancestor

 Given the root of a binary tree, find the maximum value v for which there exist different nodes a and b where v = |a.val - b.val| and a is an ancestor of b.

 A node a is an ancestor of b if either: any child of a is equal to b or any child of a is an ancestor of b.

 Example 1:
 Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
 Output: 7
 Explanation: We have various ancestor-node differences, some of which are given below :
 |8 - 3| = 5
 |3 - 7| = 4
 |8 - 1| = 7
 |10 - 13| = 3
 Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.
 
 Example 2 :
 
 Input: root = [1,null,2,null,0,3]
 Output: 3

 Constraints:

     The number of nodes in the tree is in the range [2, 5000].
     0 <= Node.val <= 10^5

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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        func maxDiff(_ root: TreeNode?, minSoFar: Int, maxSoFar: Int) -> Int {
            guard let root = root else {
                return maxSoFar - minSoFar
            }

            let minSoFar = min(minSoFar, root.val)
            let maxSoFar = max(maxSoFar, root.val)

            let diffLeft = maxDiff(root.left, minSoFar: minSoFar, maxSoFar: maxSoFar)
            let diffRight = maxDiff(root.right, minSoFar: minSoFar, maxSoFar: maxSoFar)
            return max(diffLeft, diffRight)
        }

        return maxDiff(root, minSoFar: root.val, maxSoFar: root.val)
    }
}

//faster solution

