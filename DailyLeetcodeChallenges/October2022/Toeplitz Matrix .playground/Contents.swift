import Foundation

class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let m = matrix.count
        let n = matrix.first?.count ?? 0
        for i in 1..<m{
            for j in 1..<n{
                if matrix[i][j] != matrix[i - 1][j - 1] { return false}
            }
        }
        return true
    }
}
