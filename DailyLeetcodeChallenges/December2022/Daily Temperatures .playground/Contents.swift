/*
 739. Daily Temperatures

 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

 Example 1:

 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]

 Example 2:

 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]

 Example 3:

 Input: temperatures = [30,60,90]
 Output: [1,1,0]

 Constraints:

     1 <= temperatures.length <= 10^5
     30 <= temperatures[i] <= 100

 */


import Foundation

class Solution {
      func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        var index = 0
        while index < temperatures.count {
            while !stack.isEmpty && temperatures[stack.last!] < temperatures[index] {
                let prevDay = stack.last!
                result[prevDay] = index - prevDay
                stack.removeLast()
            }
            stack.append(index)
            index += 1
        }
        return result
    }
}


//faster solution
class Solution2 {

    struct Value {
        var val : Int
        var index : Int
    }
    
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Value]()
        var output = Array(repeating: 0, count: temperatures.count)
        
        for (i, temp) in temperatures.enumerated() {
            while !stack.isEmpty, stack.last!.val < temp {
                let last = stack.removeLast()
                output[last.index] = i - last.index
            }
            let val = Value(val: temp, index: i)
            stack.append(val)
        }
        
        return output
    }
}

