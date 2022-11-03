//
//  Node.swift
//  
//
//  Created by Diogo Araújo on 26/10/2022.
//

import Foundation

public class Node<Value> {

    var value: Value
    var next: Node?

    public init(value: Value, next: Node? = nil) {

        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    public var description: String {

        guard let next = next else { return "\(value)" }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}
