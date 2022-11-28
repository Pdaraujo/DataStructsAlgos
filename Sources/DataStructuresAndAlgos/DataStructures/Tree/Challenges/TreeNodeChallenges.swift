//
//  TreeNodeChallenges.swift
//  
//
//  Created by Diogo Araújo on 08/11/2022.
//

import Foundation

final class TreeNodeChallenges {}

/// Challenge 1: Print a tree in level order
/// Print all the values in a tree in an order based on their level. Nodes in the same level should be printed on the same line.
extension TreeNodeChallenges {

    func sameLevelOrder<T>(tree: TreeNode<T>) ->[[T]] {

        var result: [[T]] = []
        var queue = QueueStack<TreeNode<T>>()
        var nodesLeftInCurrentLevel = 0
        queue.enqueue(tree)

        while queue.isEmpty == false {

            nodesLeftInCurrentLevel = queue.count

            var levelArray: [T] = []
            while nodesLeftInCurrentLevel > 0 {

                guard let node = queue.dequeue() else { break }

                levelArray.append(node.value)

                node.children.forEach { queue.enqueue($0) }
                nodesLeftInCurrentLevel -= 1
            }

            result.append(levelArray)
        }

        return result
    }
}
