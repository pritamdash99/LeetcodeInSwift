/*
 223. Rectangle Area

 Given the coordinates of two rectilinear rectangles in a 2D plane, return the total area covered by the two rectangles.

 The first rectangle is defined by its bottom-left corner (ax1, ay1) and its top-right corner (ax2, ay2).

 The second rectangle is defined by its bottom-left corner (bx1, by1) and its top-right corner (bx2, by2).
 
 Example 1:
 Input: ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
 Output: 45

 Example 2:

 Input: ax1 = -2, ay1 = -2, ax2 = 2, ay2 = 2, bx1 = -2, by1 = -2, bx2 = 2, by2 = 2
 Output: 16

  

 Constraints:

     -10^4 <= ax1 <= ax2 <= 10^4
     -10^4 <= ay1 <= ay2 <= 10^4
     -10^4 <= bx1 <= bx2 <= 10^4
     -10^4 <= by1 <= by2 <= 10^4

 */
import Foundation

class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let minX = min(ax1,bx1), maxX = max(ax2, bx2)
        let minY = min(ay1,by1), maxY = max(ay2, by2)
        let width1 = ax2 - ax1
        let width2 = bx2 - bx1
        let height1 = ay2 - ay1
        let height2 = by2 - by1
        
        let overlapWidth = maxX - minX - (width1 + width2)
        let overlapHeight = maxY - minY - (height1 + height2)
    
        let overlapArea = (overlapWidth < 0 && overlapHeight < 0) ? overlapWidth*overlapHeight : 0
        
        return width1 * height1 + width2 * height2 - overlapArea
    }
}
