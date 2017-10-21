/* QuickSort
     - Picks pivot element in array and places it in correct sorted position, while moving elements less than pivot to the left of pivot and those elements greater than pivot to the right of the pivot.
     - Recursively repeats above using two subarrays, elements left of pivot and elements right of pivot.  This effectively places all pivot elements in their correct sorted positions.
     - Runtime: O(nlogn)  (worst case is O(n^2). this occurs when pivot element is always the greatest or least element in each subarray)
 */

import UIKit

extension Array where Element: Comparable {
    mutating func quickSort(increasingOrder: (Element, Element) -> Bool) {
        recursiveQuickSort(array: &self, lowIndex: 0, highIndex: self.count-1, increasingOrder: increasingOrder)
    }
    
    private func recursiveQuickSort(array: inout [Element], lowIndex: Int, highIndex: Int, increasingOrder: (Element, Element) -> Bool) {
        // Base case. Only 1 element in subarray
        guard highIndex > lowIndex else {
            return
        }
        
        let pivotIndex = partition(array: &array, lowIndex: lowIndex, highIndex: highIndex, increasingOrder: increasingOrder)
        
        recursiveQuickSort(array: &array, lowIndex: lowIndex, highIndex: pivotIndex-1, increasingOrder: increasingOrder)
        recursiveQuickSort(array: &array, lowIndex: pivotIndex+1, highIndex: highIndex, increasingOrder: increasingOrder)
    }

    private func partition(array: inout [Element], lowIndex: Int, highIndex: Int, increasingOrder: (Element, Element) -> Bool) -> Int {
        let initialPivotIndex = highIndex
        let pivotValue = array[initialPivotIndex]
        var lessThanPivotIndex = lowIndex - 1
        
        for i in lowIndex ..< highIndex {
            if increasingOrder(array[i], pivotValue) {
                lessThanPivotIndex += 1
                array.swapAt(i, lessThanPivotIndex)
            }
        }
        let finalPivotIndex = lessThanPivotIndex + 1
        array.swapAt(finalPivotIndex, initialPivotIndex)
        return finalPivotIndex
    }
}

var numbers = [8,9,7,-8,0,11,6,2,3,1]
numbers.quickSort(increasingOrder: <)




