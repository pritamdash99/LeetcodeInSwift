/*
 345. Reverse Vowels of a String

 
 */
import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {
        var str = Array(s)
        var array = [Character]()
        for x in str{
            if x == "a" || x == "e" || x == "o" || x == "i" || x == "u" || x == "A" || x == "E" || x == "O" || x == "I" || x == "U"{
                array.append(x)
            }
        }
        
        if array.isEmpty { return s }
        
        for i in 0..<str.count{
            if str[i] == "a" || str[i] == "e" || str[i] == "o" || str[i] == "i" || str[i] == "u" || str[i] == "A" || str[i] == "E" || str[i] == "O" || str[i] == "I" || str[i] == "U"{
                str[i] = array.last!
                array.removeLast()
            }
        }
        
        return String(str)
    }
}

let x = Solution()
print(x.reverseVowels("Aa"))


//Faster solution :
class Solution2 {
    func reverseVowels(_ s: String) -> String {
        let vowels = Set("aeiouAEIOU")
        var charArray = Array(s)
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if vowels.contains(charArray[i]) {
                if vowels.contains(charArray[j]) {
                    charArray.swapAt(i, j)
                    i = i + 1
                    j = j - 1
                } else {
                    j = j - 1
                }
            } else {
                i = i + 1
            }
        }
        return String(charArray)
    }
}
