//
//  Deque.swift
//  
//
//  Created by Diogo Araújo on 04/11/2022.
//

protocol Deque {

  associatedtype Element

  var isEmpty: Bool { get }

  func peek(from direction: DequeDirection) -> Element?
  mutating func enqueue(_ element: Element, to direction: DequeDirection) -> Bool
  mutating func dequeue(from direction: DequeDirection) -> Element?
}

enum DequeDirection {

  case front
  case back
}
