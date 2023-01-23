//
//  DepthFirstSearch.swift
//  
//
//  Created by Diogo Araújo on 02/02/2023.
//

import Foundation

extension Graph where Element: Hashable {

    public func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {

        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []

        stack.push(source)
        pushed.insert(source)
        visited.append(source)

        outer: while let vertex = stack.peek() {

            let neighbors = self.edges(from: vertex)

            guard neighbors.isEmpty == false else {

                stack.pop()
                continue
            }

            for edge in neighbors {

                if pushed.contains(edge.destination) == false {

                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    continue outer
                }
            }

            stack.pop()
        }

        return visited
    }

    public func dfs(from source: Vertex<Element>) -> [Vertex<Element>] {

        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []

        self.dfs(from: source, visited: &visited, pushed: &pushed)

        return visited
    }

    private func dfs(from source: Vertex<Element>, visited: inout [Vertex<Element>], pushed: inout Set<Vertex<Element>>) {

        pushed.insert(source)
        visited.append(source)

        let neighbors = self.edges(from: source)

        for edge in neighbors {

            if pushed.contains(edge.destination) == false {

                dfs(from: edge.destination, visited: &visited, pushed: &pushed)
            }
        }
    }
}
