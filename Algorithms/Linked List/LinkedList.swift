//
//  LinkedList.swift
//  Algorithms
//
//  Created by Marc MOSCA on 17/11/2024.
//

import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
        
    var isEmpty: Bool { self.head == nil }
    
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
    
    func append(_ value: T) -> Void {
        guard self.isEmpty == false else { return self.push(value) }
        
        let newNode: Node<T> = Node(value: value)
        
        self.tail!.next = newNode
        self.tail = self.tail!.next
    }
    
    func push(_ value: T) -> Void {
        let newNode: Node<T> = Node(value: value)
        
        newNode.next = self.head
        self.head = newNode
        
        if self.tail == nil {
            self.tail = self.head
        }
    }
    
    func insert(_ value: T, at index: Int) -> Void {
        assert(index <= self.count, "index is out of bounds.")
        
        guard self.isEmpty == false && index > 0 else { return self.push(value) }
        
        let newNode: Node<T> = Node(value: value)
        let previousNode: Node<T> = self.node(at: index - 1)
        let nextNode: Node<T>? = previousNode.next
        
        newNode.next = nextNode
        previousNode.next = newNode
    }
    
    func pop() -> T? {
        defer {
            self.head = self.head?.next
            
            if self.isEmpty == true {
                self.tail = nil
            }
        }
        return self.head?.value
    }
    
    func remove(at index: Int) -> T? {
        guard index > 0 else { return self.pop() }
        
        let previousNode: Node<T> = self.node(at: index - 1)
        let node: Node<T> = self.node(at: index)
        let nextNode: Node<T>? = node.next
        
        previousNode.next = nextNode
        node.next = nil
        return node.value
    }
    
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
    var description: String {
        guard let head = self.head else { return "Empty list" }
        return String(describing: head)
    }
}
