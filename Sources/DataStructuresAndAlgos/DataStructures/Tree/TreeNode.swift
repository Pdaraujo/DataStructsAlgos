//
//  TreeNode.swift
//  
//
//  Created by Diogo Araújo on 07/11/2022.
//

import Foundation

public class TreeNode<T> {

    let value: T
    var children: [TreeNode] = []

    public init(_ value: T) {

        self.value = value
    }

    public func add(_ child: TreeNode) {

        self.children.append(child)
    }

    public func depthFirst(visit: (TreeNode) -> Void) {

        visit(self)
        self.children.forEach { $0.depthFirst(visit: visit) }
    }

    public func forEachLevelOrder(visit: (TreeNode) -> Void) {

        visit(self)
        var queue = QueueStack<TreeNode>()

        self.children.forEach { queue.enqueue($0) }

        while let node = queue.dequeue() {

            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {

    public func search(_ value: T) -> TreeNode? {

        var result: TreeNode?

        self.forEachLevelOrder { node in

            if node.value == value {

                result = node
            }
        }

        return result
    }
}
