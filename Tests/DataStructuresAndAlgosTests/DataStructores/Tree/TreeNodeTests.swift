//
//  TreeNodeTests.swift
//  
//
//  Created by Diogo Araújo on 07/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class TreeNodeTests: XCTestCase {

    func testDepthFirst() throws {

        let tree = makeBeverageTree()

        let match = "Beverageshotteablackgreenchaicoffeecocoacoldsodaginger alebitter lemonmilk"
        var result = ""
        tree.depthFirst(visit: { result += $0.value })

        XCTAssertEqual(match, result)
    }

    func testLevelOrder() throws {

        let tree = makeBeverageTree()

        let match = "Beverageshotcoldteacoffeecocoasodamilkblackgreenchaiginger alebitter lemon"
        var result = ""
        tree.forEachLevelOrder(visit: { result += $0.value })

        XCTAssertEqual(match, result)
    }

    func testSearch() throws {

        let tree = makeBeverageTree()

        let searchGinger = tree.search("ginger ale")
        let searchCoke = tree.search("Coke")

        XCTAssertEqual(searchGinger?.value, "ginger ale")
        XCTAssertNil(searchCoke)
    }

    private func makeBeverageTree() -> TreeNode<String> {

        let tree = TreeNode("Beverages")

        let hot = TreeNode("hot")
        let cold = TreeNode("cold")

        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let chocolate = TreeNode("cocoa")

        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")

        let soda = TreeNode("soda")
        let milk = TreeNode("milk")

        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")

        tree.add(hot)
        tree.add(cold)

        hot.add(tea)
        hot.add(coffee)
        hot.add(chocolate)

        cold.add(soda)
        cold.add(milk)

        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)

        soda.add(gingerAle)
        soda.add(bitterLemon)

        return tree
    }
}
