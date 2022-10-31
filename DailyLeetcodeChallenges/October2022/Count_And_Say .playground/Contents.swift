import UIKit

class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 0 && n < 31 else { return "" }
        var string = "1"
        
        for _ in 1..<n{
            string = numberOfOccurance(string)
        }
        
        return string
    }
    func numberOfOccurance(_ s : String) -> String{
        var string = ""
        let s1 = s.compactMap{
            $0
        }
        var counter = 1
        var previous = s1[0]
        for x in 1..<s1.count{
            if s1[x] == previous {
                counter += 1
            }else{
                string.append(String(counter))
                string.append(previous)
                previous = s1[x]
                counter = 1
            }
        }
        string.append(String(counter))
        string.append(previous)
        return string
    }
}

var s = Solution()
print(s.countAndSay(0))
print(s.countAndSay(1))
print(s.countAndSay(3))

//Faster Solution :
class Solution2 {
    func countAndSay(_ n: Int) -> String {
        var result = "\(1)"
        for _ in 1 ..< n {
            result = countAndSay(result)
        }
        return result
    }
    
    func countAndSay(_ s: String) -> String {
        let chars = Array(s)
        var i = 0
        var result = ""
        
        while i < chars.count {
            let c = chars[i]
            var total = 0
            
            while i < chars.count && chars[i] == c {
                i += 1
                total += 1
            }
            result += "\(total)" + String(c)
        }
        return result
    }
}


