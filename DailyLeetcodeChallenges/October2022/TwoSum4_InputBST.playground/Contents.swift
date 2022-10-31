import Foundation

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
    var resultArr : [Int] = []
    //traverse Inorder and add all the elements in an array, operate two sum in the array.
    //inorder traversal means sorted elements.
    func inOrder(_ root : TreeNode?){
        if root == nil {
            return
        }
        inOrder(root?.left)
        resultArr.append(root!.val)
        inOrder(root?.right)
    }
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard k >= -10000 && k <= 100000 else { return false }
        guard let root = root else { return false }
        inOrder(root)
        var left = 0
        var right = resultArr.count - 1
        while left < right{
            if resultArr[left] + resultArr[right] == k {
                return true
            }
            if resultArr[left] + resultArr[right] > k {
                right -= 1
            }else{
                left += 1
            }
        }
        return false
    }
}

//Better and faster solution :
class Solution2 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

        var targetSum = [Int:Int]()
        return dfs(root, &targetSum, k)
    }

    func dfs(_ node: TreeNode?, _ targetSum: inout [Int:Int], _ target: Int) -> Bool{

        if node == nil {
            return false
        }

        if targetSum[target - node!.val] != nil {
            return true
        }

        targetSum.updateValue(target - node!.val, forKey: node!.val)

        return dfs(node?.left, &targetSum, target) || dfs(node?.right, &targetSum, target)
    }
}
