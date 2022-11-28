//
//  BinarySearchTree.swift
//  
//
//  Created by Diogo Araújo on 30/11/2022.
//

import Foundation

public struct BinarySearchTree<Element: Comparable> {

    public private(set) var root: BinaryNode<Element>?

    public init() {}
}

public extension BinarySearchTree {

    mutating func insert(_ value: Element) {

        self.root = self.insert(from: self.root, value: value)
    }

    mutating func remove(_ value: Element) {

        self.root = self.remove(from: self.root, value: value)
    }

    func contains(_ value: Element) -> Bool {

        var node = self.root

        while let current = node {

            if current.value == value {

                return true
            }

            if value < current.value {

                node = current.leftChild

            } else {

                node = current.rightChild
            }
        }

        return false
    }
}

private extension BinarySearchTree {

    func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {

        guard let node else { return BinaryNode(value: value) }

        if value < node.value {

            node.leftChild = self.insert(from: node.leftChild, value: value)
            
        } else {

            node.rightChild = self.insert(from: node.rightChild, value: value)
        }

        return node
    }

    func remove(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {

        guard let node else { return nil }

        if value == node.value {

            if node.rightChild == nil && node.leftChild == nil {

                return nil
            }

            if node.rightChild == nil {

                return node.leftChild
            }

            if node.leftChild == nil {

                return node.rightChild
            }

            node.value = node.rightChild!.min.value
            node.rightChild = self.remove(from: node.rightChild, value: node.value)

        } else if value < node.value {

            node.leftChild = remove(from: node.leftChild, value: value)

        } else {

            node.rightChild = remove(from: node.rightChild, value: value)
        }

        return node
    }
}

private extension BinaryNode {

    var min: BinaryNode {

        self.leftChild?.min ?? self
    }
}

extension BinarySearchTree: CustomStringConvertible {

    public var description: String {

        guard let root = root else { return "empty tree" }

        return String(describing: root)
    }
}
