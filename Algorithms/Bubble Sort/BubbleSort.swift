//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

/// Sorts an array in ascending order using the Bubble Sort algorithm.
///
/// This function modifies the input array in place by repeatedly comparing adjacent elements and swapping them
/// if they are in the wrong order. The process is repeated until the array is fully sorted.
///
/// - Parameters:
///   - array: An array of elements to sort. The array must conform to the `Comparable` protocol.
///
/// - Returns: Void. The input array is sorted in place.
///
/// - Complexity:
///   - Time complexity: O(n^2), where `n` is the number of elements in the array.
///   - Space complexity: O(1), as it sorts the array in place.
///
/// - Example:
///   ```swift
///   var numbers = [5, 3, 4, 1, 2]
///   bubbleSort(array: &numbers)
///   print(numbers) // Prints "[1, 2, 3, 4, 5]"
///   ```
func bubbleSort<T: Comparable>(array: inout [T]) -> Void {
    for i in 0 ..< array.count {
        for j in 0 ..< array.count - i - 1 {
            guard array[j] > array[j + 1] else { continue }
            array.swapAt(j, j + 1)
        }
    }
}

/// Sorts an array in ascending order using the Bubble Sort algorithm and returns a new sorted array.
///
/// This function creates a copy of the input array and sorts it using the Bubble Sort algorithm. The original
/// array remains unchanged, and the sorted array is returned.
///
/// - Parameters:
///   - array: An array of elements to sort. The array must conform to the `Comparable` protocol.
///
/// - Returns: A new array containing the elements of the input array in ascending order.
///
/// - Note: Use this function if you want to preserve the original array and obtain a sorted copy.
///
/// - Complexity:
///   - Time complexity: O(n^2), where `n` is the number of elements in the array.
///   - Space complexity: O(n), as a new array is created for the sorted result.
///
/// - Example:
///   ```swift
///   let numbers = [5, 3, 4, 1, 2]
///   let sortedNumbers = bubbleSort(array: numbers)
///   print(sortedNumbers) // Prints "[1, 2, 3, 4, 5]"
///   ```
func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var elements: [T] = array
    
    for i in 0 ..< elements.count {
        for j in 0 ..< elements.count - i - 1 {
            guard elements[j] > elements[j + 1] else { continue }
            elements.swapAt(j, j + 1)
        }
    }
    
    return elements
}
