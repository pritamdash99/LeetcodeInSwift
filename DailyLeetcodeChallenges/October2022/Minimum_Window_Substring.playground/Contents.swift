import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.count < t.count {
            return ""
        }
        if t.count == 1 {
            return s.range(of: t) != nil ? t : ""
        }
        var chars = Array(s)
        var requiredDict = initCharDict(t)
        var map = requiredDict
        var requiredCount = 0
        for key in map.keys {
            requiredCount += map[key]!
            map[key] = 0
        }
        var slow = 0
        var minDistance = Int.max
        var index = 0
        var countOfMatched = 0
        for fast in 0 ..< chars.count {
            let char = chars[fast]
            //keep extending the right side to match all required characters in T
            if let cachedCount = map[char] {
                map[char] = cachedCount + 1
                if cachedCount < requiredDict[char]! {
                    countOfMatched += 1
                }
            }
            //start triming the left side if matched all required characters in T
            while (countOfMatched == requiredCount && slow < fast) {
                if (fast - slow) < minDistance {
                    minDistance = fast - slow
                    index = slow
                }
                let charAtSlow = chars[slow]
                if let cachedCount = map[charAtSlow] {
                    let requiredCharCount = requiredDict[charAtSlow]!
                    map[charAtSlow] = cachedCount - 1
                    if map[charAtSlow]! < requiredCharCount  {
                        countOfMatched -= 1
                    }
                }
                slow += 1
            }
        }
        if minDistance == Int.max {
            return ""
        }
        return String(chars[index ... index + minDistance])
    }
    
    func initCharDict(_ t: String) -> [Character:Int] {
        var map:[Character:Int] = [:]
        for ch in t {
            if let cached = map[ch] {
                map[ch] = cached + 1
            }else {
                map[ch] = 1
            }
        }
        return map
    }
}
