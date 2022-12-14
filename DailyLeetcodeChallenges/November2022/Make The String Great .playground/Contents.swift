/*
 1544. Make The String Great

 Given a string s of lower and upper case English letters.

 A good string is a string which doesn't have two adjacent characters s[i] and s[i + 1] where:

     0 <= i <= s.length - 2
     s[i] is a lower-case letter and s[i + 1] is the same letter but in upper-case or vice-versa.

 To make the string good, you can choose two adjacent characters that make the string bad and remove them. You can keep doing this until the string becomes good.

 Return the string after making it good. The answer is guaranteed to be unique under the given constraints.

 Notice that an empty string is also good.
 
 Example 1:

 Input: s = "leEeetcode"
 Output: "leetcode"
 Explanation: In the first step, either you choose i = 1 or i = 2, both will result "leEeetcode" to be reduced to "leetcode".

 Example 2:

 Input: s = "abBAcC"
 Output: ""
 Explanation: We have many possible scenarios, and all lead to the same answer. For example:
 "abBAcC" --> "aAcC" --> "cC" --> ""
 "abBAcC" --> "abBA" --> "aA" --> ""

 Example 3:

 Input: s = "s"
 Output: "s"

 */
import Foundation

class Solution {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        next: for char in s {
            if !stack.isEmpty {
                if (stack.last!.isLowercase && String(char) == stack.last!.uppercased()) ||
                   (stack.last!.isUppercase && String(char) == stack.last!.lowercased()) {
                       stack.removeLast()
                        continue next
                   }
            }
            stack.append(char)
        }
        return String(stack)
    }
}

let x = Solution()
print(x.makeGood("leEeetcode")) //O/p - leetcode
print(x.makeGood("abBAcC")) // O/p - ""

//Faster solution
class Solution2 {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        
        for c in s {
            if stack.isEmpty {
                stack.append(c)
                print("appended : ",c)
            } else {
                let lastC = stack.last!
                let a1 = Int(c.asciiValue!)
                let a2 = Int(lastC.asciiValue!)
                let absV = abs(Int(a1-a2))
                if absV == 32 {
                    print("removed last : ",lastC)
                    stack.removeLast()
                } else {
                    print("appended : ",c)
                    stack.append(c)
                }
            }
        }
        
        return stack.reduce("") { $0 + "\($1)" }
    }
}
let y = Solution2()
print("******")
print(y.makeGood("leEeetcode"))
/*
 O/p :
 ******
 appended :  l
 appended :  e
 removed last :  e
 appended :  e
 appended :  e
 appended :  t
 appended :  c
 appended :  o
 appended :  d
 appended :  e
 leetcode
 */
