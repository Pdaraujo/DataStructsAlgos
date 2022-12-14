//
//  AVLTree.swift
//  
//
//  Created by Diogo Araújo on 12/12/2022.
//

public struct AVLTree<Element: Comparable> {

    public private(set) var root: AVLNode<Element>?

    public init() {}
}

extension AVLTree: CustomStringConvertible {

    public var description: String {

        guard let root = self.root else { return "empty tree" }
        return String(describing: root)
    }
}

extension AVLTree {

    public mutating func insert(_ value: Element) { self.root = self.insert(from: self.root, value: value) }

    private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {

        guard let node = node else { return AVLNode(value: value) }

        if value < node.value {

            node.leftChild = insert(from: node.leftChild, value: value)

        } else {

            node.rightChild = insert(from: node.rightChild, value: value)
        }

        let balancedNode = self.balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1

        return balancedNode
    }
}

extension AVLTree {

    public func contains(_ value: Element) -> Bool {

        var current = self.root

        while let node = current {

            if node.value == value { return true }

            if value < node.value {

                current = node.leftChild

            } else {

                current = node.rightChild
            }
        }

        return false
    }
}

private extension AVLNode {

    var min: AVLNode { self.leftChild?.min ?? self }
}

extension AVLTree {

    public mutating func remove(_ value: Element) {

        self.root = remove(node: self.root, value: value)
    }

    private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {

        guard let node = node else { return nil }

        if value == node.value {

            if node.leftChild == nil && node.rightChild == nil { return nil }

            if node.leftChild == nil { return node.rightChild }

            if node.rightChild == nil { return node.leftChild }

            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)

        } else if value < node.value {

            node.leftChild = remove(node: node.leftChild, value: value)

        } else {

            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        let balancedNode = self.balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1

        return balancedNode
    }
}

private extension AVLTree {

    func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {

        let pivot = node.rightChild!

        node.rightChild = pivot.leftChild

        pivot.leftChild = node

        node.height = max(node.rightHeight, node.leftHeight) + 1
        pivot.height = max(pivot.rightHeight, pivot.leftHeight) + 1

        return pivot
    }

    func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {

        let pivot = node.leftChild!

        node.leftChild = pivot.rightChild

        pivot.rightChild = node

        node.height = max(node.rightHeight, node.leftHeight) + 1
        pivot.height = max(pivot.rightHeight, pivot.leftHeight) + 1

        return pivot
    }

    func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {

        guard let rightChild = node.rightChild else { return node }

        node.rightChild = self.rightRotate(rightChild)
        return self.leftRotate(node)
    }

    func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {

        guard let leftChild = node.leftChild else { return node }

        node.leftChild = self.leftRotate(leftChild)
        return self.rightRotate(node)
    }

    func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {

        switch node.balanceFactor {
        case 2:

            if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {

              return leftRightRotate(node)

            } else {

              return rightRotate(node)
            }

        case -2:

            if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {

              return rightLeftRotate(node)

            } else {

              return leftRotate(node)
            }

        default: return node
        }
    }
}
