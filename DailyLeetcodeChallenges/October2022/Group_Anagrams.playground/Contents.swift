import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [Int : [String]]()
        for str in strs{
            let x = Array(str)
            var sum = 0
            for i in x{
                sum += Int(i.asciiValue ?? 0)
            }
            let val = dict[sum]
            if val == nil {
                var arr = [String]()
                arr.append(str)
                dict[sum] = arr
            }else{
                dict[sum]?.append(str)
            }
        }
        return dict.values.sorted{
            $0.count < $1.count
        }
    }
}
var x = Solution()
print(x.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))

//faster solution :
class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for str in strs {
            let str1 = String(str.sorted())
            if var value = dict[str1] {
               value.append(str)
                dict[str1] = value
            } else {
                dict[str1] = [str]
            }
        }
        var output = [[String]]()
        
        for (_, value) in dict {
          output.append(value)
        }
        
        return output
    }
}
