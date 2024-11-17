//
//  LinkedList.swift
//  Algorithms
//
//  Created by Marc MOSCA on 17/11/2024.
//

import Foundation

/// A generic class representing a singly linked list.
///
/// The `LinkedList` class provides operations for managing a list of elements connected by nodes.
/// This class is designed to offer flexibility in inserting, appending, removing, and traversing elements
/// in an efficient manner.
///
/// - Generic Parameter:
///   - `T`: The type of elements stored in the linked list.
///
/// - Example:
///   ```swift
///   let list = LinkedList<Int>()
///   list.append(10)
///   list.append(20)
///   list.push(5)
///   print(list) // Prints "5 -> 10 -> 20"
///   let removed = list.pop()
///   print(removed) // Prints "5"
///   ```
final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    /// A Boolean value indicating whether the linked list is empty.
    var isEmpty: Bool { self.head == nil }
    
    /// The number of elements in the linked list.
    var count: Int {
        guard var node: Node<T> = self.head else { return 0 }
        
        var count: Int = 1
        
        while let next: Node<T> = node.next {
            count += 1
            node = next
        }
        
        return count
    }
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
    /// Appends a new value to the end of the linked list.
    ///
    /// - Parameter value: The value to append.
    func append(_ value: T) -> Void {
        guard self.isEmpty == false else { return self.push(value) }
        
        let newNode: Node<T> = Node(value: value)
        
        self.tail!.next = newNode
        self.tail = self.tail!.next
    }
    
    /// Inserts a new value at the beginning of the linked list.
    ///
    /// - Parameter value: The value to insert.
    func push(_ value: T) -> Void {
        let newNode: Node<T> = Node(value: value)
        
        newNode.next = self.head
        self.head = newNode
        
        if self.tail == nil {
            self.tail = self.head
        }
    }
    
    /// Inserts a value at the specified index in the linked list.
    ///
    /// - Parameters:
    ///   - value: The value to insert.
    ///   - index: The position at which to insert the value. Must be less than or equal to the current count.
    func insert(_ value: T, at index: Int) -> Void {
        assert(index <= self.count, "index is out of bounds.")
        
        guard self.isEmpty == false && index > 0 else { return self.push(value) }
        
        let newNode: Node<T> = Node(value: value)
        let previousNode: Node<T> = self.node(at: index - 1)
        let nextNode: Node<T>? = previousNode.next
        
        newNode.next = nextNode
        previousNode.next = newNode
    }
    
    /// Removes and returns the first element of the linked list.
    ///
    /// - Returns: The value of the removed element, or `nil` if the list is empty.
    func pop() -> T? {
        defer {
            self.head = self.head?.next
            
            if self.isEmpty == true {
                self.tail = nil
            }
        }
        return self.head?.value
    }
    
    /// Removes and returns the value at the specified index.
    ///
    /// - Parameter index: The position of the element to remove. Must be less than the current count.
    ///
    /// - Returns: The value of the removed element, or `nil` if the index is invalid.
    func remove(at index: Int) -> T? {
        guard index > 0 else { return self.pop() }
        
        let previousNode: Node<T> = self.node(at: index - 1)
        let node: Node<T> = self.node(at: index)
        let nextNode: Node<T>? = node.next
        
        previousNode.next = nextNode
        node.next = nil
        return node.value
    }
    
    /// Removes and returns the last element of the linked list.
    ///
    /// - Returns: The value of the removed element, or `nil` if the list is empty.
    func removeLast() -> T? {
        guard let head: Node<T> = self.head else { return nil }
        guard head.next != nil else { return self.pop() }
        
        var previousNode: Node<T> = head
        var currentNode: Node<T> = head
        
        while let nextNode: Node<T> = currentNode.next {
            previousNode = currentNode
            currentNode = nextNode
        }
        
        previousNode.next = nil
        self.tail = previousNode
        return currentNode.value
    }
}

extension LinkedList {
    
    /// Retrieves the node at the specified index.
    ///
    /// - Parameter index: The position of the node to retrieve. Must be within bounds.
    ///
    /// - Returns: The node at the given index.
    private func node(at index: Int) -> Node<T> {
        assert(self.head != nil, "List is empty")
        assert(index >= 0, "index must be greater or equal to 0")
        
        guard index > 0 else { return self.head! }
        
        var node: Node<T>? = self.head!.next
        
        for _ in 1 ..< index {
            node = node?.next
            guard node != nil else { break }
        }
        
        assert(node != nil, "index is out of bounds.")
        return node!
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    /// A textual representation of the linked list.
    ///
    /// If the list is empty, it returns `"Empty list"`. Otherwise, it lists the values of the nodes in order.
    var description: String {
        guard let head = self.head else { return "Empty list" }
        return String(describing: head)
    }
    
}
