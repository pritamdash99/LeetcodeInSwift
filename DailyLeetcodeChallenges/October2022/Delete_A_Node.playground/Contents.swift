import Foundation

 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 

class Solution {
    func deleteNode(_ node: ListNode?) {
    node?.val = node?.next?.val ?? 0
    node?.next = node?.next?.next
    }
}

//faster code

class Solution2 {
    func deleteNode(_ node: ListNode?) {
        guard let node = node else { return }
        if let next = node.next {
            node.val = next.val
            node.next = next.next
        }
    }
}
