//
//  Queue.swift
//  Algorithms
//
//  Created by Marc MOSCA on 16/11/2024.
//

import Foundation

/// A generic class implementing a queue data structure.
///
/// The `Queue` class represents a collection of elements organized in a first-in, first-out (FIFO) manner.
/// Elements can be enqueued (added to the back) and dequeued (removed from the front).
///
/// - Generic Parameter:
///   - `T`: The type of elements stored in the queue.
///
/// - Example:
///   ```swift
///   let queue = Queue<Int>()
///   queue.enqueue(10)
///   queue.enqueue(20)
///   print(queue.peek()) // Prints "10"
///   let removed = queue.dequeue()
///   print(removed) // Prints "10"
///   ```
final class Queue<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    /// A Boolean value indicating whether the queue is empty.
    var isEmpty: Bool { self.head == nil }
    
    /// The number of elements in the queue.
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
    
    /// Adds a new element to the end of the queue.
    ///
    /// - Parameter value: The value to add.
    func enqueue(_ value: T) -> Void {
        let node: Node<T> = Node(value: value)
        
        if self.isEmpty == true {
            self.head = node
            self.tail = node
        }
        else {
            self.tail?.next = node
            self.tail = node
        }
    }
    
    /// Removes and returns the element at the front of the queue.
    ///
    /// - Returns: The value of the removed element, or `nil` if the queue is empty.
    func dequeue() -> T? {
        guard let head: Node<T> = self.head else { return nil }
        
        self.head = self.head?.next
        head.next = nil
        
        if self.isEmpty == true {
            self.tail = nil
        }
        
        return head.value
    }
    
    /// Returns the element at the front of the queue without removing it.
    ///
    /// - Returns: The value of the first element, or `nil` if the queue is empty.
    func peek() -> T? {
        return self.head?.value
    }
}
