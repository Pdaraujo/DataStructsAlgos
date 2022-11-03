//
//  QueueRingBuffer.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public struct QueueRingBuffer<T>: Queue {

    private var ringBuffer: RingBuffer<T>

    public var isEmpty: Bool { self.ringBuffer.isEmpty }
    public var peek: T? { self.ringBuffer.first }

    public init(count: Int) {

        self.ringBuffer = RingBuffer(count: count)
    }

    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {

        self.ringBuffer.write(element)
    }

    @discardableResult
    public mutating func dequeue() -> T? {

        self.ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {

    public var description: String { String(describing: self.ringBuffer) }
}
