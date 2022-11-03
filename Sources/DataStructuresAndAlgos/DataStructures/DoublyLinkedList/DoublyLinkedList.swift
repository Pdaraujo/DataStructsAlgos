//
//  DoublyLinkedList.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public class DoublyLinkedList<T> {

    private var head: Node<T>?
    private var tail: Node<T>?

    public init() { }

    public var isEmpty: Bool { self.head == nil }

    public var first: Node<T>? { self.head }
}

public extension DoublyLinkedList {

    func append(_ value: T) {

        let newNode = Node(value: value)

        guard let tailNode = self.tail else {

            self.head = newNode
            self.tail = newNode
            return
        }

        newNode.previous = tailNode
        tailNode.next = newNode
        self.tail = newNode
    }

    func remove(_ node: Node<T>) -> T {

        let prev = node.previous
        let next = node.next

        if let prev = prev {

            prev.next = next

        } else {

            self.head = next
        }

        next?.previous = prev

        if next == nil {

            self.tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {

    public var description: String {

        var string = ""
        var current = head

        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }

        return string + "end"
    }
}

public class LinkedListIterator<T>: IteratorProtocol {

    private var current: DoublyLinkedList<T>.Node<T>?

    init(node: DoublyLinkedList<T>.Node<T>?) {

        self.current = node
    }

    public func next() -> DoublyLinkedList<T>.Node<T>? {

        defer { self.current = self.current?.next }

        return current
    }
}

extension DoublyLinkedList: Sequence {

    public func makeIterator() -> LinkedListIterator<T> {

        LinkedListIterator(node: self.head)
    }
}
