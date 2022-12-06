/*
 328. Odd Even Linked List

 Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

 The first node is considered odd, and the second node is even, and so on.

 Note that the relative order inside both the even and odd groups should remain as it was in the input.

 You must solve the problem in O(1) extra space complexity and O(n) time complexity.
 
 Example 1 :
 Input: head = [1,2,3,4,5]
 Output: [1,3,5,2,4]
 
 Example 2 :
 Input: head = [2,1,3,5,6,4,7]
 Output: [2,3,6,7,1,5,4]
 
 Constraints:

     The number of nodes in the linked list is in the range [0, 10^4].
     -10^6 <= Node.val <= 10^6

 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
//fastest solution
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var odd = head
        var even = head?.next
        let evenHead = even
        
        while(even != nil && even?.next != nil) {
            odd?.next = odd?.next?.next
            even!.next = even!.next!.next
            odd = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return head
    }
}
