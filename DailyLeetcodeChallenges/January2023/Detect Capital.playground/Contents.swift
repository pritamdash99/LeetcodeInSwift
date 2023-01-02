/*
 520. Detect Capital

 We define the usage of capitals in a word to be right when one of the following cases holds:

     All letters in this word are capitals, like "USA".
     All letters in this word are not capitals, like "leetcode".
     Only the first letter in this word is capital, like "Google".

 Given a string word, return true if the usage of capitals in it is right.

 Example 1:

 Input: word = "USA"
 Output: true

 Example 2:

 Input: word = "FlaG"
 Output: false

 Constraints:

     1 <= word.length <= 100
     word consists of lowercase and uppercase English letters.

 */
import Foundation

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        word == word.uppercased() || word == word.capitalized || word == word.lowercased()
    }
}

class Solution2 {
    func detectCapitalUse(_ word: String) -> Bool {
        var countCase1 = 0
        var countCase2 = 0
        var firstCharUpper = false
        var firstTime = true

        let rangeUpper = 65..<91
        let rangeLower = 97..<123

        for i in word {
            var ascii = Int(i.asciiValue!)
            if rangeUpper.contains(ascii) {
                countCase1 += 1
                if firstTime {
                    firstCharUpper = true
                }
            } else if rangeLower.contains(ascii) {
                countCase2 += 1
            }
            firstTime = false
        }
        print("countCase2: \(countCase2) firstCharUpper:\(firstCharUpper) word.count:\(word.count)")
        if word.count == countCase1 || word.count == countCase2 { return true }
        if word.count-1 == countCase2 && firstCharUpper { return true }
        return false
    }
}
