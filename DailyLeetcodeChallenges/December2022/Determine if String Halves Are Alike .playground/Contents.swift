/*
 1704. Determine if String Halves Are Alike

 You are given a string s of even length. Split this string into two halves of equal lengths, and let a be the first half and b be the second half.

 Two strings are alike if they have the same number of vowels ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'). Notice that s contains uppercase and lowercase letters.

 Return true if a and b are alike. Otherwise, return false.

 Example 1:

 Input: s = "book"
 Output: true
 Explanation: a = "bo" and b = "ok". a has 1 vowel and b has 1 vowel. Therefore, they are alike.

 Example 2:

 Input: s = "textbook"
 Output: false
 Explanation: a = "text" and b = "book". a has 1 vowel whereas b has 2. Therefore, they are not alike.
 Notice that the vowel o is counted twice.

 Constraints:

     2 <= s.length <= 1000
     s.length is even.
     s consists of uppercase and lowercase letters.


 */
import Foundation

class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let x = Array(s)
        var counter1 = 0 , counter2 = 0
        let count = x.count
        for i in 0..<count/2{
            if x[i] == "a" || x[i] == "e" || x[i] == "i" || x[i] == "o" || x[i] == "u" || x[i] == "A" || x[i] == "E" || x[i] == "I" || x[i] == "O" || x[i] == "U"{
                counter1 += 1
            }
        }
        let half = count/2
        for i in half..<count{
            if x[i] == "a" || x[i] == "e" || x[i] == "i" || x[i] == "o" || x[i] == "u" || x[i] == "A" || x[i] == "E" || x[i] == "I" || x[i] == "O" || x[i] == "U"{
                counter2 += 1
            }
        }
        
        return counter1 == counter2
    }
}

let x = Solution()
print(x.halvesAreAlike("uo"))

//Better Solution
class Solution2 {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels: Set<Character> = [
            "a", "e", "i", "o", "u",
            "A", "E", "I", "O", "U"
        ]
        
        let s = Array(s)
        let mid = s.count / 2
        
        var a = 0
        var b = 0
        
        for i in stride(from: 0, to: mid, by: 1) {
            a += vowels.contains(s[i]) ? 1 : 0
            b += vowels.contains(s[mid+i]) ? 1 : 0
        }
        
        return a == b
    }
}
