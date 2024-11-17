//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

/// Performs a binary search to determine if an element exists in a sorted collection.
///
/// This function searches for the specified `needle` in the `haystack` using a binary search algorithm. It returns `true` if the `needle` exists
/// in the collection, or `false` otherwise. The input `haystack` must be sorted in ascending order.
///
/// - Parameters:
///   - haystack: A sorted array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: A Boolean value indicating whether the `needle` exists in the `haystack`.
///
/// - Note: The input array must be sorted in ascending order for the binary search to work correctly.
///
/// - Complexity:
///   - Time complexity: O(log n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as it uses constant space.
///
/// - Example:
///   ```swift
///   binarySearch(haystack: [1, 2, 3, 4, 5], needle: 3) // Returns true
///   binarySearch(haystack: ["apple", "banana", "cherry"], needle: "pear") // Returns false
///   ```
func binarySearch<T: Comparable>(haystack: [T], needle: T) -> Bool {
    var lowerBound: Int = 0
    var upperBound: Int = haystack.count
    
    while lowerBound < upperBound {
        let middleIndex: Int = lowerBound + (upperBound - lowerBound) / 2
        
        guard haystack[middleIndex] != needle else { return true }
        
        if haystack[middleIndex] < needle {
            lowerBound = middleIndex + 1
        }
        else {
            upperBound = middleIndex
        }
    }
    return false
}

/// Performs a binary search to find the index of an element in a sorted collection.
///
/// This function searches for the specified `needle` in the `haystack` using a binary search algorithm. If the `needle` exists,
/// it returns the index of the element; otherwise, it returns `nil`. The input `haystack` must be sorted in ascending order.
///
/// - Parameters:
///   - haystack: A sorted array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: The index of the `needle` in the `haystack` if found, or `nil` if not found.
///
/// - Note: The input array must be sorted in ascending order for the binary search to work correctly.
///
/// - Complexity:
///   - Time complexity: O(log n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as it uses constant space.
///
/// - Example:
///   ```swift
///   binarySearch(haystack: [1, 2, 3, 4, 5], needle: 3) // Returns 2
///   binarySearch(haystack: ["apple", "banana", "cherry"], needle: "pear") // Returns nil
///   ```
func binarySearch<T: Comparable>(haystack: [T], needle: T) -> Int? {
    var lowerBound: Int = 0
    var upperBound: Int = haystack.count
    
    while lowerBound < upperBound {
        let middleIndex: Int = lowerBound + (upperBound - lowerBound) / 2
        
        guard haystack[middleIndex] != needle else { return middleIndex }
        
        if haystack[middleIndex] < needle {
            lowerBound = middleIndex + 1
        }
        else {
            upperBound = middleIndex
        }
    }
    return nil
}
