//
//  File.swift
//  
//
//  Created by Diogo Araújo on 26/10/2022.
//

import Foundation

public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() {}

    public var isEmpty: Bool { self.head == nil }

    public mutating func push(_ value: Value) {

        self.copyNodes()

        self.head = Node(value: value, next: self.head)

        if self.tail == nil {

            self.tail = self.head
        }
    }

    public mutating func append(_ value: Value) {

        self.copyNodes()

        guard self.isEmpty == false else {

            self.push(value)
            return
        }

        self.tail?.next = Node(value: value)

        self.tail = self.tail?.next
    }

    public mutating func node(at index: Int) -> Node<Value>? {

        self.copyNodes()

        var currentNode = self.head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {

            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    @discardableResult
    public mutating func insert(value: Value, after node: Node<Value>) -> Node<Value>? {

        self.copyNodes()

        guard self.tail !== node else {

            self.append(value)
            return self.tail
        }

        node.next = Node(value: value, next: node.next)

        return node.next
    }

    @discardableResult
    public mutating func pop() -> Value? {

        self.copyNodes()

        defer {

            self.head = self.head?.next

            if self.isEmpty { self.tail = nil }
        }

        return self.head?.value
    }

    @discardableResult
    public mutating func removeLast() -> Value? {

        self.copyNodes()

        guard let head = self.head else { return nil }

        guard head.next != nil else { return self.pop() }

        var previous = head
        var current = head

        while let next = current.next {

            previous = current
            current = next
        }

        previous.next = nil
        self.tail = previous

        return current.value
    }

    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {

        guard let node = copyNodes(returningCopyOf: node) else { return nil }

        defer {

            if node.next === self.tail {

                self.tail = node
            }

            node.next = node.next?.next
        }
        return node.next?.value
    }

    public mutating func reverse() {

        self.tail = self.head
        var prev = self.head
        var current = self.head?.next

        prev?.next = nil

        while current != nil {

            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        self.head = prev
    }
}
// MARK: - Collection
extension LinkedList: Collection {

    public struct Index: Comparable {

        public var node: Node<Value>?

        static public func ==(lhs: Index, rhs: Index) -> Bool {

            switch (lhs.node, rhs.node) {

            case let (left?, right?):
                return left === right

            case (nil, nil):
                return true

            default:
                return false
            }
        }

        static public func <(lhs: Index, rhs: Index) -> Bool {

            guard lhs != rhs else { return false }

            let nodes = sequence(first: lhs.node) { $0?.next }

            return nodes.contains { $0 === rhs.node }
        }
    }

    public var startIndex: Index { Index(node: self.head) }

    public var endIndex: Index { Index(node: self.tail?.next) }

    public func index(after i: Index) -> Index { Index(node: i.node?.next) }

    public subscript(position: Index) -> Value { position.node!.value }
}

extension LinkedList: CustomStringConvertible {

    public var description: String {

        guard let head = self.head else { return "Empty list" }

        return String(describing: head)
    }
}

private extension LinkedList {

    mutating func copyNodes() {

        // this checks if we have multiple references to the head Node, if we do we make a copy
        guard isKnownUniquelyReferenced(&self.head) == false else { return }

        guard var oldNode = self.head else { return }

        self.head = Node(value: oldNode.value)

        var newNode = self.head

        while let nextOldNode = oldNode.next {

            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next

            oldNode = nextOldNode
        }

        self.tail = newNode
    }

    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {

        guard isKnownUniquelyReferenced(&self.head) == false else { return nil }

        guard var oldNode = head else { return nil }

        self.head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?

        while let nextOldNode = oldNode.next {

            if oldNode === node {
                nodeCopy = newNode
            }

            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }

        return nodeCopy
    }
}
