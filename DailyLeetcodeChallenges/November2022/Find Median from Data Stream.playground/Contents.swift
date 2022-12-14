/*
 295. Find Median from Data Stream

 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

     For example, for arr = [2,3,4], the median is 3.
     For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.

 Implement the MedianFinder class:

     1. MedianFinder() initializes the MedianFinder object.
     2. void addNum(int num) adds the integer num from the data stream to the data structure.
     3. double findMedian() returns the median of all elements so far. Answers within 10^-5 of the actual answer will be accepted.

  

 Example 1:

 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]

 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0

  

 Constraints:

     : -10^5 <= num <= 10^5
     : There will be at least one element in the data structure before calling findMedian.
     : At most 5 * 10^4 calls will be made to addNum and findMedian.

  

 Follow up:

     If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
     If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?


 */
import Foundation

class MedianFinder {
    var arr = [Int]()
    init() {
    }
    
    func addNum(_ num: Int) {
        arr.append(num)
    }
    
    func findMedian() -> Double {
        arr.sort()
        let n = arr.count
        
        if n % 2 == 0 {
            let x : Double = Double((arr[n/2 - 1] + arr[n/2]))
            return x/2.0
        }else{
            let x : Int = n/2
            return Double(arr[x])
        }
    }
}

/*
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */

let x = MedianFinder()
x.addNum(1)
x.addNum(2)
print(x.findMedian())
x.addNum(3)
print(x.findMedian())
