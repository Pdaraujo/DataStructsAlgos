//
//  AdjacencyList.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public class AdjacencyList<T: Hashable>: Graph {

    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]

    public init() {}

    public func createVertex(data: T) -> Vertex<T> {

        let vertex = Vertex(index: self.adjacencies.count, data: data)

        self.adjacencies[vertex] = []

        return vertex
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] {

        self.adjacencies[source] ?? []
    }

    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {

        self.edges(from: source).first { $0.destination == destination }?.weight
    }

    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {

        let edge = Edge(source: source, destination: destination, weight: weight)

        self.adjacencies[source]?.append(edge)
    }
}

extension AdjacencyList: CustomStringConvertible {

    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }
        return result
    }
}
