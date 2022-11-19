/*
 587. Erect the Fence
 
 You are given an array trees where trees[i] = [xi, yi] represents the location of a tree in the garden.

 You are asked to fence the entire garden using the minimum length of rope as it is expensive. The garden is well fenced only if all the trees are enclosed.

 Return the coordinates of trees that are exactly located on the fence perimeter.
 
 Example 1 :
 Input: points = [[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]]
 Output: [[1,1],[2,0],[3,3],[2,4],[4,2]]
 
 Example 2 :
 Input: points = [[1,2],[2,2],[4,2]]
 Output: [[4,2],[2,2],[1,2]]
 
 Constraints:

     1 <= points.length <= 3000
     points[i].length == 2
     0 <= xi, yi <= 100
     All the given points are unique.

 Tricky Mathematical qsn , refer to https://www.youtube.com/watch?v=74mBq_eTb2s for approach.
 */
import Foundation

class Solution {
    private class Point{
        var x, y : Int
        init(_ x : Int, _ y : Int){
            self.x = x
            self.y = y
        }
    }
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        var points = [Point]()
        for point in trees{
            points.append(Point(point[0], point[1]))
        }
        var res = [Point]()
        if points.count == 1 { return trees }
        
        let n = points.count
        
        var dup = Set<[Int]>()
        var hull = [Point]()
        
        points.sort {
            if $0.y == $1.y{
                return $0.x < $1.x
            }else{
                return $0.y < $1.y
            }
        }
        
        hull.append(points[0])
        hull.append(points[1])
        
        //lower hull
        for i in 2..<n{
            var top = hull.removeLast()
            while !hull.isEmpty && ccw(hull.last! , top, points[i]) < 0{
                top = hull.removeLast()
            }
            hull.append(top)
            hull.append(points[i])
        }
        
        // upper hull
        
        var i = n - 2
        while i >= 0 {
            var top = hull.removeLast()
            while !hull.isEmpty && ccw(hull.last! , top, points[i]) < 0{
                top = hull.removeLast()
            }
            hull.append(top)
            hull.append(points[i])
            i -= 1
        }
        
        for p in hull{
            var temp = [Int]()
            temp.append(p.x)
            temp.append(p.y)
            if dup.contains(temp) { continue }
            dup.insert(temp)
            res.append(p)
        }
        
        var ans = Array(repeating: Array(repeating: 0, count: 2), count: res.count)
        i = 0
        for p in res{
            ans[i][0] = p.x
            ans[i][1] = p.y
            i += 1
        }
        
        return ans
    }
    
    private func ccw(_ a : Point, _ b : Point, _ c : Point) -> Int {
        let crossProduct : Double = Double((b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x))
        if crossProduct < 0 { return -1}
        else if crossProduct > 0 { return 1}
        else { return 0 }
    }
}

let x = Solution()
print(x.outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]]))
/*
 O/p : [[2, 0], [4, 2], [3, 3], [2, 4], [1, 1]]
 */




