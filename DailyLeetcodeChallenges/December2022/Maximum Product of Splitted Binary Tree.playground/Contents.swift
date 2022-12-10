/*
 1339. Maximum Product of Splitted Binary Tree

 Given the root of a binary tree, split the binary tree into two subtrees by removing one edge such that the product of the sums of the subtrees is maximized.

 Return the maximum product of the sums of the two subtrees. Since the answer may be too large, return it modulo 10^9 + 7.

 Note that you need to maximize the answer before taking the mod and not after taking it.
 
 Example 1 :
 Input: root = [1,2,3,4,5,6]
 Output: 110
 Explanation: Remove the red edge and get 2 binary trees with sum 11 and 10. Their product is 110 (11*10)
 
 Example 2 :
 Input: root = [1,null,2,3,4,null,null,5,6]
 Output: 90
 Explanation: Remove the red edge and get 2 binary trees with sum 15 and 6.Their product is 90 (15*6)
 
 Constraints:

     The number of nodes in the tree is in the range [2, 5 * 10^4].
     1 <= Node.val <= 10^4

 
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

//fastest solution
class Solution {
    func maxProduct(_ root: TreeNode?) -> Int {
        guard let root = root else{
            return 0
        }
        var ans = 0
        let total = dfsHelper(root)
        ProductHelper(root, total, &ans)
        return ans%1000000007
    }
    
    private func dfsHelper(_ root: TreeNode?) -> Int{
        guard let root = root else{
            return 0
        }
        return dfsHelper(root.left) + dfsHelper(root.right)  + root.val
    }
    
    private func ProductHelper(_ root: TreeNode?,_ total: Int,_ ans: inout Int) -> Int{
        guard let root = root else{
            return 0
        }
        let left = ProductHelper(root.left, total, &ans)
        let right = ProductHelper(root.right, total,&ans)
        let up = total - left - right - root.val
        let option1 = left * (root.val + right + up)
        let option2 = right * (root.val + left + up)
        let option3 = up * (root.val + left + right)
        ans = max(ans, max(option1, max(option2, option3)))
        return left + right + root.val
    }
}
