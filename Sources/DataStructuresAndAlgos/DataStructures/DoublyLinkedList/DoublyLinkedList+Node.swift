//
//  DoublyLinkedList+Node.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import Foundation

public extension DoublyLinkedList {

    class Node<T> {

      public var value: T
      public var next: Node<T>?
      public var previous: Node<T>?

      public init(value: T) {

        self.value = value
      }
    }
}

extension DoublyLinkedList.Node: CustomStringConvertible {

  public var description: String { String(describing: value) }
}
