/*
 451. Sort Characters By Frequency

 Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

 Return the sorted string. If there are multiple answers, return any of them.

 Example 1:

 Input: s = "tree"
 Output: "eert"
 Explanation: 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

 Example 2:

 Input: s = "cccaaa"
 Output: "aaaccc"
 Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
 Note that "cacaca" is incorrect, as the same characters must be together.

 Example 3:

 Input: s = "Aabb"
 Output: "bbAa"
 Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.

 Constraints:

     1 <= s.length <= 5 * 10^5
     s consists of uppercase and lowercase English letters and digits.

 */
import Foundation

class Solution {
    func frequencySort(_ s: String) -> String {
        let arr = Array(s)
        var result = ""
        var dict = [Character:Int]()
        for x in arr{
            dict[x,default: 0] += 1
        }
        let arr1 = dict.sorted{
            $0.value > $1.value
        }
        for x in arr1{
            for _ in 1...x.value{
                result.append(String(x.key))
            }
        }
        return result
    }
}

let x = Solution()
print(x.frequencySort("tree"))
print(x.frequencySort("acbrasteeui"))
/*
 O/p :
 eetr
 aaeeurcistb
 */
