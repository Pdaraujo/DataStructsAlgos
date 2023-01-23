//
//  Graph.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public enum EdgeType {

    case directed, undirected
}

public protocol Graph {

    associatedtype Element

    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

public extension Graph {

    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {

        self.addDirectedEdge(from: source, to: destination, weight: weight)
        self.addDirectedEdge(from: destination, to: source, weight: weight)
    }

    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {

        switch edge {

        case .directed:
            self.addDirectedEdge(from: source, to: destination, weight: weight)

        case .undirected:
            self.addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}
