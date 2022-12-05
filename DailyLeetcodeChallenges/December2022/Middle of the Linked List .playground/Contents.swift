/*
 876. Middle of the Linked List

 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.
 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 
 Example 2:
 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

 Constraints:

     The number of nodes in the list is in the range [1, 100].
     1 <= Node.val <= 100

 */
import Foundation
import Darwin

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
//Fast and space efficient
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var current = head
        var counter = 1
        while current?.next != nil {
            current = current?.next
            counter += 1
        }
        var n = counter / 2
        current = head
        while n != 0 {
            current = current?.next
            n -= 1
        }
        return current
    }
}

//Slower solution but space efficient O(1)
class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var (fast,slow) = (head, head)
        while(fast?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}

//fastest solution but consumes O(n) space
class Solution3 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var a: [ListNode?] = []
        var current: ListNode? = head
        var total = 0
        while current != nil {
            total += 1
            a.append(current)
            current = current?.next
        }
        return a[a.count / 2]
    }
}
