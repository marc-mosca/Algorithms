//
//  Node.swift
//  Algorithms
//
//  Created by Marc MOSCA on 17/11/2024.
//

import Foundation

final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
}
