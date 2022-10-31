import Foundation
class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    var i = nums.count - 3
    while i >= 0 {
        if arr[i] + arr[i+1] > arr[i+2] {
            return arr[i] + arr[i+1] + arr[i+2]
        }
        i -= 1
    }
    return 0
    }
 }
//faster code
func largestPerimeter(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        for i in (2..<nums.count).reversed() {
            let c1 = nums[i]
            print(c1)
            let c2 = nums[i-1]
            print(c2)
            let c3 = nums[i-2]
            print(c3)
            if c2 + c3 > c1 {
                return c1+c2+c3
            }
        }
        return 0
}

largestPerimeter([1,2,3,1,6,1,8])

//fastest code

class Solution2 {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let sorted = nums.sorted { $0 > $1 }
        for i in 0..<sorted.count-2 {
            if sorted[i] < sorted[i+1] + sorted[i+2] {
                return sorted[i] + sorted[i+1] + sorted[i+2]
            }
        }
        return 0
    }
}
