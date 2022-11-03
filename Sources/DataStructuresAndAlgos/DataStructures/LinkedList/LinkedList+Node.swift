//
//  LinkedList+Node.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

// MARK: - Node
public extension LinkedList {

    class Node<Value> {

        var value: Value
        var next: Node?

        public init(value: Value, next: Node? = nil) {

            self.value = value
            self.next = next
        }
    }
}

extension LinkedList.Node: CustomStringConvertible {

    public var description: String {

        guard let next = next else { return "\(value)" }

        return "\(value) -> " + String(describing: next) + " "
    }
}
