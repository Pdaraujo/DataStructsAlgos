//
//  BinarySearchTreeChallenges.swift
//  
//
//  Created by Diogo Araújo on 06/12/2022.
//

import Foundation

public class BinarySearchTreeChallenges {}

///Challenge 1: Binary tree or binary search tree?
///Create a function that checks if a binary tree is a binary search tree.
public extension BinarySearchTreeChallenges {

    func isBinarySearchTree<T>(tree: BinarySearchTree<T>) -> Bool { tree.root?.isBinarySearchTree == true }
}

private extension BinaryNode where Element: Comparable {

    var isBinarySearchTree: Bool {

        self.isBTS(self, min: nil, max: nil)
    }

    func isBTS(_ tree: BinaryNode<Element>?, min: Element?, max: Element?) -> Bool {

        guard let tree else { return true }

        if let min, tree.value <= min {

            return false
        }

        if let max, tree.value > max {

            return false
        }

        return self.isBTS(tree.leftChild, min: nil, max: tree.value) && self.isBTS(tree.rightChild, min: tree.value, max: nil)
    }
}

///Challenge 2: Equatable
///The binary search tree currently lacks Equatable conformance. Your challenge is to adopt the Equatable protocol.
public extension BinarySearchTreeChallenges {

    func isEqual<Element>(lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool { lhs == rhs }
}

extension BinarySearchTree: Equatable {

    public static func == (lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool {

        isEqual(lhs.root, rhs.root)
    }

    private static func isEqual(_ lhs: BinaryNode<Element>?, _ rhs: BinaryNode<Element>?) -> Bool {

        guard let lhs, let rhs else { return lhs == nil && rhs == nil }

        return lhs.value == rhs.value && isEqual(lhs.leftChild, rhs.leftChild) && isEqual(lhs.rightChild, rhs.rightChild)
    }
}

///Challenge 3: Is it a subtree?
///Create a method that checks if the current tree contains all the elements of another tree. You may require that elements are Hashable.
public extension BinarySearchTreeChallenges {

    func contains<T: Hashable>(subtree: BinarySearchTree<T>, in tree: BinarySearchTree<T>) -> Bool { tree.contains(subtree: subtree) }
}

private extension BinarySearchTree where Element: Hashable {

    func contains(subtree: BinarySearchTree) -> Bool {

        var set: Set<Element> = []

        self.root?.traverseInOrder { set.insert($0) }

        var contains = true

        subtree.root?.traverseInOrder { element in

            contains = contains && set.contains(where: { $0 == element } )
        }

        return contains
    }
}
