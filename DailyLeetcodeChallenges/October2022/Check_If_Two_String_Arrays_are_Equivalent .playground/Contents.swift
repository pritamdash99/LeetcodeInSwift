import Foundation

class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var str1 = String()
        var str2 = String()
        for x in word1 {
            str1.append(x)
        }
        for x in word2 {
            str2.append(x)
        }
        if str1 == str2 { return true }
        else {
            return false
        }
    }
}
