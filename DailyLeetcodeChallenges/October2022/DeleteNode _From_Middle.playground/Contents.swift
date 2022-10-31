import Foundation

 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        if head?.next?.next == nil {
            head?.next = nil
            return head
        }
        var counter = 1
        var current = head
        while current?.next != nil {
            current = current?.next!
            counter += 1
        }
        current = head
        var n = (counter / 2)
        while n > 0 {
            current = current?.next!
            n -= 1
        }
        current?.val = current?.next?.val ?? 0
        current?.next = current?.next?.next
        
        return head
    }
}

//my solution very fast.
