//
//  AVLTreeChallenges.swift
//  
//
//  Created by Diogo Araújo on 14/12/2022.
//

import Foundation

public class AVLTreeChallenges {}

/// Challenge 1: Number of leaves
/// How many leaf nodes are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height h?
public extension AVLTreeChallenges {

    func numberOfLeafNodes<T>(_ tree: AVLTree<T>) -> Int { tree.leafNodes() }
}

private extension AVLTree {

    func leafNodes() -> Int { Int(pow(2.0, Double(self.root?.height ?? 0))) }
}

/// Challenge 2: Number of nodes
/// How many nodes are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height h?
public extension AVLTreeChallenges {

//    func nodesInTreeOf(height: Int) -> Int {
//
//        var totalHeight = 0
//
//        for currentHeight in 0...height {
//
//            totalHeight += Int(pow(2.0, Double(currentHeight)))
//        }
//
//        return totalHeight
//    }

    // This is the best solution
    func nodesInTreeOf(height: Int) -> Int {

        Int(pow(2.0, Double(height + 1))) - 1
    }
}
