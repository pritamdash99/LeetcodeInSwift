/*
 290. Word Pattern

 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

 Example 1:

 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true

 Example 2:

 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false

 Example 3:

 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false

 Constraints:

     1 <= pattern.length <= 300
     pattern contains only lower-case English letters.
     1 <= s.length <= 3000
     s contains only lowercase English letters and spaces ' '.
     s does not contain any leading or trailing spaces.
     All the words in s are separated by a single space.


 */
import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var characterForWord: [String: Character] = [:]
        var wordForCharacter: [Character: String] = [:]
        let words = s.components(separatedBy: .whitespaces)

        guard pattern.count == words.count else { return false }

        for (i, character) in pattern.enumerated() {
            let word = words[i]
            if characterForWord[word] == nil && wordForCharacter[character] == nil {
                characterForWord[word] = character
                wordForCharacter[character] = word
            } else if characterForWord[word] == character && wordForCharacter[character] == word {
                continue
            } else {
                return false
            }
        }

        return true
    }
}


class Solution2 {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.components(separatedBy: " ")
        guard words.count == pattern.count else { return false }
        var cWord = [Character: String]()
        var wordC = [String: Character]()
        for (c, word) in zip(pattern, words) {
            if let match = cWord[c], match != word {
                return false
            } else if let match = wordC[word], match != c {
                return false
            }
            cWord[c] = word
            wordC[word] = c
        }
        return true
    }
}

