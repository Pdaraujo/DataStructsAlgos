//
//  Queue.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public protocol Queue {

    associatedtype Element

    var isEmpty: Bool { get }
    var peek: Element? { get }

    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}
