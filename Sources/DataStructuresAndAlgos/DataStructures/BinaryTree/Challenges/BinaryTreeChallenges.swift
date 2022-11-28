//
//  BinaryTreeChallenges.swift
//  
//
//  Created by Diogo Araújo on 29/11/2022.
//

import Foundation

public class BinaryTreeChallenges {}

/// Challenge 1: Height of a Tree
/// Given a binary tree, find the height of the tree. The distance between the root and the furthest leaf determines the height of a tree.
/// The height of a binary tree with a single node is zero since the single node is both the root and the furthest leaf.
extension BinaryTreeChallenges {

    func height<T>(of node: BinaryNode<T>?) -> Int {

        guard let node = node else { return -1 }

        return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
    }
}

/// Challenge 2: Serialization
extension BinaryTreeChallenges {

    func serialize<T>(_ node: BinaryNode<T>?) -> [T?] {

        var result: [T?] = []

        self.traversePreOrder(of: node, visit: { result.append($0) })

        return result
    }

    private func traversePreOrder<T>(of node: BinaryNode<T>?, visit: (T?) -> Void) {

        visit(node?.value)

        if let left = node?.leftChild {

            traversePreOrder(of: left, visit: visit)

        } else {

            visit(nil)
        }

        if let right = node?.rightChild {

            traversePreOrder(of: right, visit: visit)

        } else {

            visit(nil)
        }
    }
}
