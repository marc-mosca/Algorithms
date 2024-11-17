//
//  Node.swift
//  Algorithms
//
//  Created by Marc MOSCA on 17/11/2024.
//

import Foundation

/// A class representing a single node in a singly linked list.
///
/// The `Node` class is a generic structure that stores a value of type `T` and a reference to the next node in the list.
/// This class is useful for building linked list data structures.
///
/// - Generic Parameter:
///   - `T`: The type of the value stored in the node.
///
/// - Example:
///   ```swift
///   let node1 = Node(value: 1)
///   let node2 = Node(value: 2)
///   node1.next = node2
///   print(node1) // Prints "1 -> 2"
///   ```
final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    
    /// A textual representation of the node and the list starting from it.
    ///
    /// The description recursively includes the value of the node and the values of all subsequent nodes,
    /// separated by `" -> "`. The string ends after the last node.
    ///
    /// - Example:
    ///   ```swift
    ///   let node1 = Node(value: 1)
    ///   let node2 = Node(value: 2)
    ///   node1.next = node2
    ///   print(node1.description) // Prints "1 -> 2"
    ///   ```
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
    
}
