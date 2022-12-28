/*
 1962. Remove Stones to Minimize the Total

 You are given a 0-indexed integer array piles, where piles[i] represents the number of stones in the ith pile, and an integer k. You should apply the following operation exactly k times:

     Choose any piles[i] and remove floor(piles[i] / 2) stones from it.

 Notice that you can apply the operation on the same pile more than once.

 Return the minimum possible total number of stones remaining after applying the k operations.

 floor(x) is the greatest integer that is smaller than or equal to x (i.e., rounds x down).

 Example 1:

 Input: piles = [5,4,9], k = 2
 Output: 12
 Explanation: Steps of a possible scenario are:
 - Apply the operation on pile 2. The resulting piles are [5,4,5].
 - Apply the operation on pile 0. The resulting piles are [3,4,5].
 The total number of stones in [3,4,5] is 12.

 Example 2:

 Input: piles = [4,3,6,7], k = 3
 Output: 12
 Explanation: Steps of a possible scenario are:
 - Apply the operation on pile 2. The resulting piles are [4,3,3,7].
 - Apply the operation on pile 3. The resulting piles are [4,3,3,4].
 - Apply the operation on pile 0. The resulting piles are [2,3,3,4].
 The total number of stones in [2,3,3,4] is 12.

 Constraints:

     1 <= piles.length <= 10^5
     1 <= piles[i] <= 10^4
     1 <= k <= 10^5

 */
import Foundation

class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        let heap = Heap(from: piles, with: { $0 > $1 })
        
        for _ in 1...k {
            guard let top = heap.poll() else { break }
            let remains = top - top / 2
            heap.insert(remains)
        }
        
        var result = 0
        while let top = heap.poll() {
            result += top
        }
        return result
    }
}

public final class Heap<T>: CustomStringConvertible {
    
    public typealias Comparator = (T, T) -> Bool
    
    private var elements = [T]()
    private let comparator: Comparator
    
    // MARK: - Init
    
    public init(with comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    public init(from array: [T], with comparator: @escaping Comparator) {
        self.elements = array
        self.comparator = comparator
        
        (0...array.count / 2).reversed().forEach { i in
            sift(down: i)
        }
    }
    
    // MARK: - Public Get Properties
    
    public var root: T? { elements.first }
    public var isEmpty: Bool { elements.isEmpty }
    public var size: Int { elements.count }
    
    // MARK: - Public Methods
    
    @discardableResult public func poll() -> T? {
        guard !isEmpty else { return nil }
        
        let pollingElement = elements[0]
        
        elements[0] = elements[size - 1]
        elements.removeLast()
        
        sift(down: 0)
        
        return pollingElement
    }
    
    public func insert(_ element: T) {
        elements.append(element)
        sift(up: size - 1)
    }
    
    // MARK: - Private Methods
    
    private func sift(up index: Int) {
        var i = index
        
        while comparator(elements[i], elements[(i - 1) / 2]) {
            elements.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }
    
    private func sift(down index: Int) {
        var i = index
        
        while 2 * i + 1 < size {
            
            let left = 2 * i + 1
            let right = 2 * i + 2
            
            var j = left
            
            if right < size, comparator(elements[right], elements[left]) {
                j = right
            }
            
            if comparator(elements[i], elements[j]) {
                break
            }
            
            elements.swapAt(i, j)
            
            i = j
        }
    }
    
    public var description: String {
        "\(elements)"
    }
    
}
