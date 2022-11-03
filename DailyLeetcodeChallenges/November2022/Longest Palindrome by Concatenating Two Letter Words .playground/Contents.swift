/*
 2131. Longest Palindrome by Concatenating Two Letter Words

 You are given an array of strings words. Each element of words consists of two lowercase English letters.

 Create the longest possible palindrome by selecting some elements from words and concatenating them in any order. Each element can be selected at most once.

 Return the length of the longest palindrome that you can create. If it is impossible to create any palindrome, return 0.

 A palindrome is a string that reads the same forward and backward.
 */
import Foundation

class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var res = 0
        var dict = [String: Int]()
        
        for word in words {
            dict[word, default:0] += 1
        }
        
        var central = false
        for word in dict.keys {
            let arr = Array(word)
            if arr[0] == arr[1] {
                if dict[word]! % 2 == 0 {
                    res += dict[word]!
                } else {
                    res += dict[word]! - 1
                    central = true
                }
            } else if arr[0] < arr[1] {
                let reversedWord = String(word.reversed())
                res += 2 * min(dict[word]!, dict[reversedWord, default: 0])
            }
            
        }
        if central {
            res += 1
        }
        return 2*res
    }
}
