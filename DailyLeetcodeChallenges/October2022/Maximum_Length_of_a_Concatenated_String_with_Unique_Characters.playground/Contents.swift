import Foundation

class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var maxLen = 0
        let list: [Set<Character>] = arr.map {
            let result = Set($0)
            return result.count != $0.count ? [] : result
        } .filter { $0.isEmpty == false }
        
        func union(_ set: Set<Character>, _ candidate: [Set<Character>], _ start: Int) {
            maxLen = max(maxLen, set.count)
            if start >= candidate.count { return }
            for index in start ..< candidate.count {
                if candidate[index].isDisjoint(with: set) {
                    union(set.union(candidate[index]), candidate, index + 1)
                }
            }
        }
        
        union([], list, 0)
        return maxLen
    }
}


// Solution :

class Solution2 {
    var maxVal = Int.min
    
    func maxLength(_ arr: [String]) -> Int {
        var sArr:[String] = []
        for item in arr{
            if isUniqu(item){ sArr.append(item)}
        }
        var set:Set<Character> = Set()
        helper(sArr, 0, &set)
        return maxVal
    }
    
    func helper(_ arr: [String],_ index:Int,_ current: inout Set<Character>){
        maxVal = max(maxVal, current.count)
        if index == arr.count{ return }
        let item = arr[index]
        var found = false
        for char in item{
            if current.contains(char) {
                found = true
                break
            }
        }
        if found == false{
            for char in item{ current.insert(char) }
            helper(arr, index+1, &current)
            for char in item{ current.remove(char) }
        }
        helper(arr, index+1, &current)
    }
    
    func isUniqu(_ item:String)->Bool{
        var set:Set<Character> = Set()
        for char in item{
            if set.contains(char) {return false}
            set.insert(char)
        }
        return true
    }
}


//Solution :
class Solution3 {
    func maxLength(_ arr: [String]) -> Int {
        var charSet = Set<Character>()
        
        func overlap(_ charSet: Set<Character>, _ s: String) -> Bool {
            let arr = Array(s)
            
            var prev = Set<Character>()
            
            for ch in arr {
                if charSet.contains(ch) || prev.contains(ch) {
                    return true
                }
                prev.insert(ch)
            }
            
            return false
        }
        
        func dfs(_ i: Int) -> Int {
            if i == arr.count {
                return charSet.count
            }
            
            var res = 0
            if !overlap(charSet, arr[i]) {
                let chars = Array(arr[i])
                for ch in chars {
                    charSet.insert(ch)
                }
                res = dfs(i + 1)
                for ch in chars {
                    charSet.remove(ch)
                }
            }
            
            return max(res, dfs(i + 1))
        }
        
        return dfs(0)
    }
}

//Solution
class Solution4 {
    func maxLength(_ arr: [String]) -> Int {
        let n = arr.count
        
        func backtrack(_ i: Int, _ tmp: String) -> Int {
            if i >= n {
                return tmp.count
            }
            
            var res = tmp.count
            for j in i..<n {
                let s = tmp + arr[j]
                if Set(Array(s)).count == s.count {
                    res = max(res, backtrack(j + 1, s))
                }
            }
            
            return res
        }
        
        return backtrack(0, "")
    }
}
