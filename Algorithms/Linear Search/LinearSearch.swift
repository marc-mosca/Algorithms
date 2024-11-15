//
//  LinearSearch.swift
//  Algorithms
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

/// Performs a linear search to determine if an element exists in a collection.
///
/// This function iterates through the elements of the `haystack` to check if the specified `needle` exists.
/// It stops searching as soon as the element is found and returns `true`.
///
/// - Parameters:
///   - haystack: An array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: A Boolean value indicating whether the `needle` exists in the `haystack`.
///
/// - Complexity:
///   - Time complexity: O(n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as no additional storage is used.
///
/// - Example:
///   ```swift
///   linearSearch(haystack: [1, 2, 3, 4], needle: 3) // Returns true
///   linearSearch(haystack: ["apple", "banana", "cherry"], needle: "pear") // Returns false
///   ```
func linearSearch<T: Comparable>(haystack: [T], needle: T) -> Bool {
    for value in haystack where value == needle {
        return true
    }
    return false
}

/// Performs a linear search to find the index of an element in a collection.
///
/// This function iterates through the elements of the `haystack` to locate the specified `needle`. If the `needle` is found,
/// it returns the index of the element. If not, it returns `nil`.
///
/// - Parameters:
///   - haystack: An array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: The index of the `needle` if it exists in the `haystack`; otherwise, `nil`.
///
/// - Complexity:
///   - Time complexity: O(n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as no additional storage is used.
///
/// - Example:
///   ```swift
///   linearSearch(haystack: [1, 2, 3, 4], needle: 3) // Returns 2
///   linearSearch(haystack: ["apple", "banana", "cherry"], needle: "pear") // Returns nil
///   ```
func linearSearch<T: Comparable>(haystack: [T], needle: T) -> Int? {
    for (index, value) in haystack.enumerated() where value == needle {
        return index
    }
    return nil
}
