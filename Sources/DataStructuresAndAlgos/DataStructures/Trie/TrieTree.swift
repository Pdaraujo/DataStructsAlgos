//
//  TrieTree.swift
//  
//
//  Created by Diogo Araújo on 15/12/2022.
//

public class TrieTree<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {

    public typealias Node = TrieNode<CollectionType.Element>

    public private(set) var collections: Set<CollectionType> = []

    private let root = Node(key: nil, parent: nil)

    public var count: Int { self.collections.count }

    public var isEmpty: Bool { self.collections.isEmpty }

    public init() {}
}

public extension TrieTree {

    func insert(_ collection: CollectionType) {

        var current = self.root

        for element in collection {

            if current.children[element] == nil {

                current.children[element] = Node(key: element, parent: current)
            }

            current = current.children[element]!
        }

        if current.isTerminating {

            return

        } else {

            current.isTerminating = true
            self.collections.insert(collection)
        }
    }

    func contains(_ collection: CollectionType) -> Bool {

        var current = self.root

        for element in collection {

            guard let child = current.children[element] else { return false }
            current = child
        }

        return current.isTerminating
    }

    func remove(_ collection: CollectionType) {

        var current = self.root

        for element in collection {

            guard let child = current.children[element] else { return }
            current = child
        }

        guard current.isTerminating else { return }

        current.isTerminating = false
        self.collections.remove(collection)

        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            
            parent.children[current.key!] = nil
            current = parent
        }
    }
}

public extension TrieTree where CollectionType: RangeReplaceableCollection {

    func collections(startingWith prefix: CollectionType) -> [CollectionType] {

        var current = self.root

        for element in prefix {

            guard let child = current.children[element] else { return [] }

            current = child
        }

        return self.collections(startingWith: prefix, after: current)
    }

    private func collections(
        startingWith prefix: CollectionType,
        after node: Node
    ) -> [CollectionType] {

        var results: [CollectionType] = []

        if node.isTerminating { results.append(prefix) }

        for child in node.children.values {

            var prefix = prefix
            prefix.append(child.key!)
            
            results.append(
                contentsOf: collections(
                    startingWith: prefix,
                    after: child
                )
            )
        }

        return results
    }
}
