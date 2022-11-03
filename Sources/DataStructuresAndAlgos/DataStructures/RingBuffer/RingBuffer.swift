//
//  RingBuffer.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

/// https://github.com/kodecocodes/swift-algorithm-club/blob/master/Ring%20Buffer/RingBuffer.playground/Contents.swift
import Foundation

public struct RingBuffer<T> {

    private var array: [T?]
    private var readIndex = 0
    private var writeIndex = 0

    private var availableSpaceForReading: Int { self.writeIndex - self.readIndex }
    private var availableSpaceForWriting: Int { self.array.count - self.availableSpaceForReading }

    public var isEmpty: Bool { self.availableSpaceForReading == 0 }
    public var isFull: Bool { self.availableSpaceForWriting == 0 }

    public var first: T? { self.array[self.readIndex] }

    public init(count: Int) {

        self.array = Array(repeating: nil, count: count)
    }
}

public extension RingBuffer {

    @discardableResult
    mutating func write(_ element: T) -> Bool {

        guard self.isFull == false else { return false }

        defer { self.writeIndex += 1 }

        self.array[wrapped: self.writeIndex] = element
        return true
    }

    // Returns nil if the buffer is empty.
    mutating func read() -> T? {

        guard self.isEmpty == false else { return nil }

        defer {

            self.array[wrapped: self.readIndex] = nil
            self.readIndex += 1
        }
        return self.array[wrapped: self.readIndex]
    }
}

// We use this extension to get the circular index
private extension Array {

    subscript (wrapped index: Int) -> Element {

        get { self[index % count] }
        set { self[index % count] = newValue }
    }
}

extension RingBuffer: CustomStringConvertible {

    public var description: String {

        let values = (0..<self.availableSpaceForReading).map {

            String(describing: self.array[($0 + self.readIndex) % self.array.count]!)
        }

        return "[" + values.joined(separator: ", ") + "]"
    }
}
