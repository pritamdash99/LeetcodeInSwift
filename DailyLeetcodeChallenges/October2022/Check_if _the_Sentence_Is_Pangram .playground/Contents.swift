import Foundation
class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        if sentence.count < 26 { return false }
        var store : [Character : Bool] = [:]
        store["a"] = false
        store["b"] = false
        store["c"] = false
        store["d"] = false
        store["e"] = false
        store["f"] = false
        store["g"] = false
        store["h"] = false
        store["i"] = false
        store["j"] = false
        store["k"] = false
        store["l"] = false
        store["m"] = false
        store["n"] = false
        store["o"] = false
        store["p"] = false
        store["q"] = false
        store["r"] = false
        store["s"] = false
        store["t"] = false
        store["u"] = false
        store["v"] = false
        store["w"] = false
        store["x"] = false
        store["y"] = false
        store["z"] = false
        
        for s in sentence{
            store[s] = true
        }
        
        for v in store.values{
            if v == false{
                return false
            }
        }
        return true
    }
}

class Solution2 {
    func checkIfPangram(_ sentence: String) -> Bool {
        if sentence.count < 26 { return false }
        
        var set : Set<Character> = []
        
        for x in sentence {
            set.insert(x)
        }
        
        if set.count == 26 { return true }
        else { return false}
    }
}
