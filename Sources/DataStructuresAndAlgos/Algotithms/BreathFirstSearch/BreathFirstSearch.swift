//
//  BreathFirstSearch.swift
//  
//
//  Created by Diogo Araújo on 31/01/2023.
//

import Foundation

extension Graph where Element: Hashable {

    public func breathFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {

        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []

        queue.enqueue(source)
        enqueued.insert(source)

        while let vertex = queue.dequeue() {

            visited.append(vertex)
            let neighborEdges = self.edges(from: vertex)

            neighborEdges.forEach { edge in

                if enqueued.contains(edge.destination) == false {

                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)

                }
            }
        }
        return visited
    }

    public func bfs(from source: Vertex<Element>) -> [Vertex<Element>] {

        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []

        queue.enqueue(source)
        enqueued.insert(source)

        self.bfs(queue: &queue, enqueued: &enqueued, visited: &visited)

        return visited
    }

    private func bfs(
        queue: inout QueueStack<Vertex<Element>>,
        enqueued: inout Set<Vertex<Element>>,
        visited: inout [Vertex<Element>]
    ) {

        guard let vertex = queue.dequeue() else { return }

        visited.append(vertex)
        let neighborEdges = self.edges(from: vertex)

        neighborEdges.forEach { edge in

            if enqueued.contains(edge.destination) == false {

                queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)

            }
        }

        self.bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
    }
}
