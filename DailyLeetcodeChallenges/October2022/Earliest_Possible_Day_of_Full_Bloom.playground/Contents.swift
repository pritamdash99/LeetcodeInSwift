import Foundation

class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        var plant : [Seed] = []
        for i in 0..<plantTime.count{
            plant.append(Seed(plantTime[i], growTime[i]))
        }
        plant.sort{
            $0.growthTime > $1.growthTime
        }
        var time = 0
        var maxi = 0
        for x in plant{
            time += x.plantTime
            maxi = max(maxi,time+x.growthTime)
        }
        return maxi
    }
}

private class Seed{
    var plantTime : Int
    var growthTime : Int
    
    init( _ plantTime :Int, _ growthTime : Int) {
        self.plantTime = plantTime
        self.growthTime = growthTime
    }
}

var x = Solution()
print(x.earliestFullBloom([1,4,3], [2,3,1]))


//Faster solution
//.0 = plantTime and .1 = growthTime
class Solution2 {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        let sorted = zip(plantTime,growTime).sorted { $0.1 > $1.1 }
        var curPlant = 0
        var curMax = 0
        for i in 0..<sorted.count {
            curPlant += sorted[i].0
            curMax = max(curMax, curPlant + sorted[i].1)
        }
        return curMax
        
    }
}

/*
 
 The zip function

 The zip function is provided by the Swift standard library and creates a sequence of pairs built out of two underlying sequences, where the elements of the ith pair are the ith elements of each underlying sequence.

 For instance, in the following example, zip takes two arrays and creates a pair of these two arrays:

 let numbers = [3, 5, 9, 10] let alphabeticNumbers = ["Three", "Five", "Nine", "Ten"] let zipped = zip(alphabeticNumbers, numbers).map { $0 }

 The value for zipped will be [("Three", 3), ("Five", 5), ("Nine", 9), ("Ten", 10)].

 */


//Another Solution - Also fast.
class Solution3 {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        var array = [(Int, Int)]()
        for i in 0..<plantTime.endIndex {
            array.append((plantTime[i], growTime[i]))
        }
        
        array.sort {
            $0.1 > $1.1
        }
        
        var ret = 0
        var nextSeedTime = 0
        for (p, g) in array {
            ret = max(ret, nextSeedTime + p + g)
            nextSeedTime += p
        }
        
        return ret
    }
}

