import Foundation

class Solution {
        func breakPalindrome(_ palindrome: String) -> String {
        let n = palindrome.count
        if n < 2 {
            return ""
        }
        var string = palindrome.compactMap({
                    $0
                })
        for i in 0..<n/2{
            if string[i] != "a"{
                string[i] = "a"
                let string2 = String(string)
                return string2
            }
        }
        string[n-1] = "b"
        let string2 = String(string)
        return string2
    }
}

//Faster solution
class Solution2 {
    func breakPalindrome(_ palindrome: String) -> String {
        var palindromeChars = Array(palindrome)
        if palindromeChars.count == 1 {
            return ""
        }
        for i in 0..<palindromeChars.count / 2 {
            if palindromeChars[i] != "a" {
                palindromeChars[i] = "a"
                return String(palindromeChars)
            }
        }
        
        palindromeChars[palindromeChars.count - 1] = "b"
        return String(palindromeChars)
    }
}
