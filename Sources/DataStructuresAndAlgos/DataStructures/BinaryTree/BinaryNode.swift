//
//  BinaryNode.swift
//  
//
//  Created by Diogo Araújo on 10/11/2022.
//

import Foundation

public class BinaryNode<Element> {

    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?

    public init(value: Element) {
        self.value = value
    }

    public func traverseInOrder(visit: (Element) -> Void) {

        self.leftChild?.traverseInOrder(visit: visit)

        visit(self.value)

        self.rightChild?.traverseInOrder(visit: visit)
    }

    public func traversePreOrder(visit: (Element) -> Void) {

        visit(self.value)

        self.leftChild?.traversePreOrder(visit: visit)
        self.rightChild?.traversePreOrder(visit: visit)
    }

    public func traversePostOrder(visit: (Element) -> Void) {
        
        self.leftChild?.traversePostOrder(visit: visit)
        self.rightChild?.traversePostOrder(visit: visit)

        visit(self.value)
    }

    func invertTree(_ root: BinaryNode?) -> BinaryNode? {

        guard let root = root else { return nil }

        let tempLeft = invertTree(root.rightChild)
        let tempRight = invertTree(root.leftChild)

        root.leftChild = tempLeft
        root.rightChild = tempRight

        return root
    }
}

extension BinaryNode: CustomStringConvertible {

    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(
        for node: BinaryNode?,
        _ top: String = "",
        _ root: String = "",
        _ bottom: String = ""
    ) -> String {

        guard let node = node else { return root + "nil\n" }

        if node.leftChild == nil && node.rightChild == nil { return root + "\(node.value)\n" }

        return diagram(
            for: node.rightChild,
            top + " ", top + "┌──", top + "│ "
        )
        + root + "\(node.value)\n"
        + diagram(
            for: node.leftChild,
            bottom + "│ ", bottom + "└──", bottom + " "
        )
    }
}
