//
//  Stack.swift
//  
//
//  Created by Diogo Araújo on 24/10/2022.
//

import Foundation

public struct Stack<Element> {

    private var storage: [Element] = []

    public var isEmpty: Bool { self.storage.isEmpty }

    public init(_ elements: [Element] = []) {

        self.storage = elements
    }

    public mutating func push(_ element: Element) {

        self.storage.append(element)
    }

    @discardableResult
    public mutating func pop() -> Element? {
        
        self.storage.popLast()
    }

    public mutating func peek() -> Element? {

        self.storage.last
    }
}

extension Stack: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Element...) {

        self.storage = elements
    }
}

extension Stack: CustomDebugStringConvertible {

    public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
}
