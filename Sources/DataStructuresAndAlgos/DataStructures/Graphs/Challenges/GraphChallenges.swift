//
//  GraphChallenges.swift
//  
//
//  Created by Diogo Araújo on 30/01/2023.
//

import Foundation

public final class GraphChallenges {}

// Challenge 1: Count the number of paths
// Write a method to count the number of paths between two vertices in a directed graph.

// Solution to Challenge 1
// The goal is to write a function that finds the number of paths between two vertices in a graph.
// One solution is to perform a depth-first traversal and keep track of the visited vertices.

extension Graph where Element: Hashable {

    public func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {

        var numberOfPaths = 0

        var visited: Set<Vertex<Element>> = []

        self.paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)

        return numberOfPaths
    }

    private func paths(
        from source: Vertex<Element>,
        to destination: Vertex<Element>,
        visited: inout Set<Vertex<Element>>,
        pathCount: inout Int
    ) {

        visited.insert(source)

        if source == destination {

            pathCount += 1

        } else {

            let neighbours = self.edges(from: source)

            for edge in neighbours {

                if visited.contains(edge.destination) == false {

                    self.paths(
                        from: edge.destination,
                        to: destination,
                        visited: &visited,
                        pathCount: &pathCount
                    )
                }
            }
        }

        visited.remove(source)
    }
}

// Challenge 2: Graph your friends
// Vincent has three friends, Chesley, Ruiz and Patrick. Ruiz has friends as well: Ray, Sun, and a mutual friend of Vincent’s.
// Patrick is friends with Cole and Kerry. Cole is friends with Ruiz and Vincent. Create an adjacency list that represents this friendship graph.
// Which mutual friend do Ruiz and Vincent share?

extension Graph where Element == String {

    static func mutualFriends() -> [String] {

        let graph = AdjacencyList<String>()

        let vincent = graph.createVertex(data: "vincent")
        let chesley = graph.createVertex(data: "chesley")
        let ruiz = graph.createVertex(data: "ruiz")
        let patrick = graph.createVertex(data: "patrick")
        let ray = graph.createVertex(data: "ray")
        let sun = graph.createVertex(data: "sun")
        let cole = graph.createVertex(data: "cole")
        let kerry = graph.createVertex(data: "kerry")

        graph.add(.undirected, from: vincent, to: chesley, weight: 1)
        graph.add(.undirected, from: vincent, to: ruiz, weight: 1)
        graph.add(.undirected, from: vincent, to: patrick, weight: 1)
        graph.add(.undirected, from: ruiz, to: ray, weight: 1)
        graph.add(.undirected, from: ruiz, to: sun, weight: 1)
        graph.add(.undirected, from: patrick, to: cole, weight: 1)
        graph.add(.undirected, from: patrick, to: kerry, weight: 1)
        graph.add(.undirected, from: cole, to: ruiz, weight: 1)
        graph.add(.undirected, from: cole, to: vincent, weight: 1)

        let vincentsFriends = Set(graph.edges(from: vincent).map { $0.destination.data })

        let ruizsFriends = Set(graph.edges(from: ruiz).map { $0.destination.data })

        return Array(vincentsFriends.intersection(ruizsFriends))
    }
}
