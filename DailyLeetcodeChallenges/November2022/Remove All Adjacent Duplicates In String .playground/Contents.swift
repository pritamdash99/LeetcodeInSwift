/*
 1047. Remove All Adjacent Duplicates In String
 
 You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

 We repeatedly make duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.


 Example 1:

 Input: s = "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".

 Example 2:

 Input: s = "azxxzy"
 Output: "ay"

 
 */
import Foundation

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var s1 = ""
        var stack = [Character]()
        for x in s {
            if stack.isEmpty{
                stack.append(x)
                s1 += String(x)
            }else{
                if x == stack.last{
                    s1.removeLast()
                    stack.removeLast()
                }else{
                    stack.append(x)
                    s1 += String(x)
                }
            }
        }
        return s1
    }
}

let x = Solution()
print(x.removeDuplicates("abbaca"))
print(x.removeDuplicates("azxxzy"))

//Faster solution

class Solution2 {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if !stack.isEmpty, stack.last == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}
