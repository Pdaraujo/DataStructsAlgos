//
//  DequeLinkedList.swift
//  
//
//  Created by Diogo Araújo on 04/11/2022.
//

import Foundation

public class DequeLinkedList<T>: Deque {

    private var list = DoublyLinkedList<T>()

    var isEmpty: Bool { self.list.isEmpty }
    
    public init() {}

    func peek(from direction: DequeDirection) -> T? {

        switch direction {

        case .front: return self.list.first?.value
        case .back: return self.list.last?.value
        }
    }

    @discardableResult
    func enqueue(_ element: T, to direction: DequeDirection) -> Bool {

        switch direction {
        case .front:

            self.list.prepend(element)
            return true

        case .back:

            self.list.append(element)
            return true
        }
    }

    func dequeue(from direction: DequeDirection) -> T? {

        switch direction {
        case .front:

            guard let first = self.list.first else { return nil }
            let value = self.list.remove(first)

            return value

        case .back:

            guard let last = self.list.last else { return nil }
            let value = self.list.remove(last)

            return value
        }
    }
}

extension DequeLinkedList: CustomStringConvertible {

  public var description: String { String(describing: list) }
}
