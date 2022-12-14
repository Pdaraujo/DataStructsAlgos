//
//  AVLNode.swift
//  
//
//  Created by Diogo Araújo on 12/12/2022.
//

public class AVLNode<Element> {

    public var value: Element
    public var leftChild: AVLNode?
    public var rightChild: AVLNode?

    public var height = 0

    public var balanceFactor: Int { self.leftHeight - self.rightHeight }

    public var leftHeight: Int { self.leftChild?.height ?? -1 }

    public var rightHeight: Int { self.rightChild?.height ?? -1 }

    public init(value: Element) {

        self.value = value
    }
}

extension AVLNode: CustomStringConvertible {

    public var description: String { diagram(for: self) }

    private func diagram(
        for node: AVLNode?,
        _ top: String = "",
        _ root: String = "",
        _ bottom: String = ""
    ) -> String {

        guard let node = node else { return root + "nil\n" }

        if node.leftChild == nil && node.rightChild == nil { return root + "\(node.value)\n" }

        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension AVLNode {

    public func traverseInOrder(visit: (Element) -> Void) {

        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }

    public func traversePreOrder(visit: (Element) -> Void) {

        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }

    public func traversePostOrder(visit: (Element) -> Void) {

        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

