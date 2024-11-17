//
//  SquareSearch.swift
//  Algorithms
//
//  Created by Marc MOSCA on 15/11/2024.
//

import Foundation

/// Performs a square root search (Jump Search) to determine if an element exists in a sorted collection.
///
/// This function searches for the specified `needle` in the `haystack` using the Jump Search algorithm.
/// It is a step-based search method, which works efficiently on sorted arrays by jumping ahead by square root-sized steps.
///
/// - Parameters:
///   - haystack: A sorted array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: A Boolean value indicating whether the `needle` exists in the `haystack`.
///
/// - Note: The input array must be sorted in ascending order for the Jump Search algorithm to work correctly.
///
/// - Complexity:
///   - Time complexity: O(√n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as it uses constant space.
///
/// - Example:
///   ```swift
///   squareSearch(haystack: [1, 2, 3, 4, 5], needle: 3) // Returns true
///   squareSearch(haystack: [10, 20, 30, 40, 50], needle: 25) // Returns false
///   ```
func squareSearch<T: Comparable>(haystack: [T], needle: T) -> Bool {
    let steps: Int = Int(sqrt(Double(haystack.count)))
    var index: Int = steps
    
    while index < haystack.count {
        guard haystack[index] < needle else { break }
        index += steps
    }
    
    index -= steps
    for _ in 0 ..< steps where index < haystack.count {
        guard haystack[index] < needle else { return true }
        index += 1
    }
    
    return false
}

/// Performs a square root search (Jump Search) to find the index of an element in a sorted collection.
///
/// This function searches for the specified `needle` in the `haystack` using the Jump Search algorithm.
/// It is a step-based search method, which works efficiently on sorted arrays by jumping ahead by square root-sized steps.
/// If the `needle` is found, it returns the index of the element; otherwise, it returns `nil`.
///
/// - Parameters:
///   - haystack: A sorted array of elements to search.
///   - needle: The element to search for.
///
/// - Returns: The index of the `needle` in the `haystack` if found, or `nil` if not found.
///
/// - Note: The input array must be sorted in ascending order for the Jump Search algorithm to work correctly.
///
/// - Complexity:
///   - Time complexity: O(√n), where `n` is the number of elements in `haystack`.
///   - Space complexity: O(1), as it uses constant space.
///
/// - Example:
///   ```swift
///   squareSearch(haystack: [1, 2, 3, 4, 5], needle: 3) // Returns 2
///   squareSearch(haystack: [10, 20, 30, 40, 50], needle: 25) // Returns nil
///   ```
func squareSearch<T: Comparable>(haystack: [T], needle: T) -> Int? {
    let steps: Int = Int(sqrt(Double(haystack.count)))
    var index: Int = steps
    
    while index < haystack.count {
        guard haystack[index] < needle else { break }
        index += steps
    }
    
    index -= steps
    for _ in 0 ..< steps where index < haystack.count {
        guard haystack[index] < needle else { return index }
        index += 1
    }
    
    return nil
}
