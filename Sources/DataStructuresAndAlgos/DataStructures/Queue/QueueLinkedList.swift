//
//  QueueLinkedList.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public class QueueLinkedList<T>: Queue {

    private var list = DoublyLinkedList<T>()

    public init() {}

    public var isEmpty: Bool { self.list.isEmpty }

    public var peek: T? { self.list.first?.value }

    @discardableResult
    public func enqueue(_ element: T) -> Bool {

        self.list.append(element)
        return true
    }

    @discardableResult
    public func dequeue() -> T? {

        guard self.isEmpty == false,
              let element = self.list.first
        else { return nil }

        return self.list.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {

  public var description: String { String(describing: list) }
}
