//
//  BreathFirstSearchTests.swift
//  
//
//  Created by Diogo Araújo on 31/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class BreathFirstSearchTests: XCTestCase {

    func testIterative() throws {

        let graph = AdjacencyList<String>()
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.add(.undirected, from: a, to: b, weight: nil)
        graph.add(.undirected, from: a, to: c, weight: nil)
        graph.add(.undirected, from: a, to: d, weight: nil)
        graph.add(.undirected, from: b, to: e, weight: nil)
        graph.add(.undirected, from: c, to: f, weight: nil)
        graph.add(.undirected, from: c, to: g, weight: nil)
        graph.add(.undirected, from: e, to: h, weight: nil)
        graph.add(.undirected, from: e, to: f, weight: nil)
        graph.add(.undirected, from: f, to: g, weight: nil)

        let vertices = graph.breathFirstSearch(from: a).map { $0.data }

        let expected = ["A", "B", "C", "D", "E", "F", "G", "H"]

        XCTAssert(expected == vertices)
    }

    func testRecursive() throws {

        let graph = AdjacencyList<String>()
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.add(.undirected, from: a, to: b, weight: nil)
        graph.add(.undirected, from: a, to: c, weight: nil)
        graph.add(.undirected, from: a, to: d, weight: nil)
        graph.add(.undirected, from: b, to: e, weight: nil)
        graph.add(.undirected, from: c, to: f, weight: nil)
        graph.add(.undirected, from: c, to: g, weight: nil)
        graph.add(.undirected, from: e, to: h, weight: nil)
        graph.add(.undirected, from: e, to: f, weight: nil)
        graph.add(.undirected, from: f, to: g, weight: nil)

        let vertices = graph.bfs(from: a).map { $0.data }

        let expected = ["A", "B", "C", "D", "E", "F", "G", "H"]

        XCTAssert(expected == vertices)
    }
}
