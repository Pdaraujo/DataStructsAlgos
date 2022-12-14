//
//  TrieNode.swift
//  
//
//  Created by Diogo Araújo on 15/12/2022.
//

public class TrieNode<Key: Hashable> {

    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false

    public init(key: Key?, parent: TrieNode?) {

        self.key = key
        self.parent = parent
    }
}
