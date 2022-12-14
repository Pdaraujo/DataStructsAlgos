//
//  TrieTreeTests.swift
//  
//
//  Created by Diogo Araújo on 16/12/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class TrieTreeTests: XCTestCase {

    func testInsertAndContains() throws {

        let tree = TrieTree<String>()
        tree.insert("cenas")
        tree.insert("cute")

        XCTAssertTrue(tree.contains("cenas"))
        XCTAssertTrue(tree.contains("cute"))
        XCTAssertFalse(tree.contains("cutess"))
    }

    func testRemove() throws {

        let tree = TrieTree<String>()
        tree.insert("cenas")
        tree.insert("cute")

        XCTAssertTrue(tree.contains("cenas"))
        XCTAssertTrue(tree.contains("cute"))

        tree.remove("cenas")
        XCTAssertFalse(tree.contains("cenas"))
        XCTAssertTrue(tree.contains("cute"))
    }

    func testFilterCollections() throws {

        let trie = TrieTree<String>()
        trie.insert("car")
        trie.insert("card")
        trie.insert("care")
        trie.insert("cared")
        trie.insert("cars")
        trie.insert("carbs")
        trie.insert("carapace")
        trie.insert("cargo")

        let prefixedWithCar = trie.collections(startingWith: "car")
        XCTAssertTrue(prefixedWithCar.containsSameElements(as: ["car", "carbs", "care", "cared", "cars", "carapace", "cargo", "card"]))

        let prefixedWithCare = trie.collections(startingWith: "care")
        XCTAssertEqual(prefixedWithCare, ["care", "cared"])
    }

    func testCollections() throws {

        let trie = TrieTree<String>()

        XCTAssertTrue(trie.isEmpty == true)

        trie.insert("car")
        trie.insert("card")
        trie.insert("care")
        trie.insert("cared")
        trie.insert("cars")
        trie.insert("carbs")
        trie.insert("carapace")
        trie.insert("cargo")

        let result = ["car", "carbs", "care", "cared", "cars", "carapace", "cargo", "card"]

        XCTAssertTrue(trie.isEmpty == false)
        XCTAssertTrue(trie.count == 8)
        XCTAssertTrue(trie.collections == Set(result))

        let prefixedWithCar = trie.collections(startingWith: "car")
        XCTAssertTrue(prefixedWithCar.containsSameElements(as: result))

        let prefixedWithCare = trie.collections(startingWith: "care")
        XCTAssertEqual(prefixedWithCare, ["care", "cared"])
    }

}

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}

