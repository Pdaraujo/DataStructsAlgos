//
//  AdjacencyMatrix.swift
//  
//
//  Created by Diogo Araújo on 30/01/2023.
//

import Foundation

public final class AdjacencyMatrix<T>: Graph {

    private var vertices: [Vertex<T>] = []
    private var weights: [[Double?]] = []

    public init() {}

    public func createVertex(data: T) -> Vertex<T> {

        let vertex = Vertex(index: self.vertices.count, data: data)
        self.vertices.append(vertex)

        for i in 0..<self.weights.count {

            self.weights[i].append(nil)
        }

        let row = [Double?](repeating: nil, count: vertices.count)
        weights.append(row)

        return vertex
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] {

        var edges: [Edge<T>] = []

        for column in 0..<weights.count {

            if let weight = weights[source.index][column] {

                edges.append(Edge(source: source, destination: vertices[column], weight: weight))
            }
        }

        return edges
    }

    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {

        self.weights[source.index][destination.index]
    }

    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {

        self.weights[source.index][destination.index] = weight
    }
}

extension AdjacencyMatrix: CustomStringConvertible {

    public var description: String {

        let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")

        var grid: [String] = []

        for i in 0..<weights.count {

            var row = ""

            for j in 0..<weights.count {

                if let value = weights[i][j] {

                    row += "\(value)\t"

                } else {

                    row += "ø\t\t"
                }
            }

            grid.append(row)
        }

        let edgesDescription = grid.joined(separator: "\n")

        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}
