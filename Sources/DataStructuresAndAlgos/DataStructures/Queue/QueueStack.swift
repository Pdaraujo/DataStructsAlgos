//
//  QueueStack.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public struct QueueStack<T> : Queue {

    private var leftStack: [T] = []
    private var rightStack: [T] = []

    public var isEmpty: Bool { self.leftStack.isEmpty && self.rightStack.isEmpty }
    public var peek: T? { self.leftStack.isEmpty == false ? self.leftStack.last : self.rightStack.first }

    public init() {}

    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {

        self.rightStack.append(element)
        return true
    }

    @discardableResult
    public mutating func dequeue() -> T? {

        if self.leftStack.isEmpty {

            self.leftStack = self.rightStack.reversed()
            self.rightStack.removeAll()
        }

        return self.leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {

    public var description: String { String(describing: self.leftStack.reversed() + self.rightStack) }
}
