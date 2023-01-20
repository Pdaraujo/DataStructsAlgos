//
//  PriorityQueue.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import Foundation

public struct PriorityQueue<Element: Equatable> {

    private var heap: Heap<Element>

    public init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {

        self.heap = Heap(elements: elements, sort: sort)
    }
}

extension PriorityQueue: Queue {

    public var isEmpty: Bool { self.heap.isEmpty }

    public var peek: Element? { self.heap.peek() }

    public mutating func enqueue(_ element: Element) -> Bool {

        self.heap.insert(element)
        return true
    }

    public mutating func dequeue() -> Element? {

        self.heap.remove()
    }
}
