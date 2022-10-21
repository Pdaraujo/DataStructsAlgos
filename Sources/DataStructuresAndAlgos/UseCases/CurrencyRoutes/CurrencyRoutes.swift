//
//  CurrencyRoutes.swift
//  
//
//  Created by Diogo Araújo on 20/10/2022.
//

import Foundation

public class CurrencyRoutes {

    /// Given a dictionary of rates with:
    /// - keys: currency-iso code from currency + currency-iso code to currency
    /// - values: rates in Decimal
    /// And a currency pair:
    /// - currency-iso code from currency + currency-iso code to currency
    /// Returns a tuple with rate: Decimal and the minimal route: String from currency to currency
    /// Example:
    /// - rates : ["GBPRUB": 100, "USDGBP": 0.7]
    /// - currencyPair: "USDRUB"

    func findRateAndRoute(for currencyPair: String, rates: [String: Decimal]) -> (rate: Decimal, route: String) {

        let start = String(currencyPair.prefix(3))
        let finish = String(currencyPair.suffix(3))
        var ratesDict: [String: [String]] = [:]
        var rate: Decimal = 1.0

        for (key, _) in rates {

            let from = String(key.prefix(3))
            let to = String(key.suffix(3))

            ratesDict[from, default: []].append(to)
        }

        let graph = self.setupGraph(with: ratesDict, rates: rates)

        let path = self.shortestPath(source: start, destination: finish, graph: graph)

        var left = 0
        var right = 5

        while(right < path.count) {

            let startIndex = path.index(path.startIndex, offsetBy: left)
            let endIndex = path.index(path.startIndex, offsetBy: right)
            let subStr = String(path[startIndex...endIndex])
            if let inRate = rates[subStr] {
                rate *= inRate
            }

            left += 3
            right += 3
        }

        return (rate, path)
    }
}

// MARK: - Entities

private extension CurrencyRoutes {

    class Node {

        var currency : String // unique identifier required for each node
        var distance : Int = Int.max
        var route: String
        var rate: Decimal = 1.0
        var edges = [Edge]()
        var visited = false

        init(visited: Bool, currency: String, edges: [Edge]) {
            self.visited = visited
            self.currency = currency
            self.edges = edges
            self.route = ""
        }

        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.currency == rhs.currency
        }
    }

    class Edge {
        var from: Node
        var to: Node
        var weight: Int
        var rate: Decimal

        init(to: Node, from: Node, weight: Int = 1, rate: Decimal = 1.0) {
            self.to = to
            self.from = from
            self.weight = weight
            self.rate = rate
        }
    }

    class Graph {
        var nodes: [Node] = []
    }
}

// MARK: - Private Methods

private extension CurrencyRoutes {

    func setupGraph(with currencies: [String: [String]], rates: [String: Decimal]) -> Graph {

        let graph = Graph()

        for (key, values) in currencies {

            let newNode = Node(visited: false, currency: key, edges: [])

            if graph.nodes.contains(where: { $0.currency == key }) == false {
                graph.nodes.append(newNode)
            }

            for value in values {

                let newNode = Node(visited: false, currency: value, edges: [])

                if graph.nodes.contains(where: { $0.currency == value }) == false {
                    graph.nodes.append(newNode)
                }
            }
        }

        // create all the edges to link the nodes
        for (key, values) in currencies {

            if let fromNode = graph.nodes.first(where: { $0.currency == key }) {

                for value in values {

                    if let toNode = graph.nodes.first(where: { $0.currency == value }) {

                        let forwardEdge = Edge(to: toNode, from: fromNode, rate: rates[key+value]!)
                        fromNode.edges.append(forwardEdge)
                    }
                }
            }
        }
        return graph
    }


    func shortestPath (source: String, destination: String, graph: Graph) -> String {

        var currentNode = graph.nodes.first{ $0.currency == source }!
        currentNode.visited = true
        currentNode.distance = 0

        var toVisit = [Node]()
        toVisit.append(currentNode)

        while (toVisit.isEmpty == false) {

            currentNode.route += currentNode.currency
            toVisit = toVisit.filter{ $0.currency != currentNode.currency }
            currentNode.visited = true

            // Go to each adjacent vertex and update the path length
            for connectedEdge in currentNode.edges {

                let distance = currentNode.distance + connectedEdge.weight

                if (distance < connectedEdge.to.distance) {

                    connectedEdge.to.distance = distance
                    connectedEdge.to.route = currentNode.route
                    toVisit.append(connectedEdge.to)

                    if (connectedEdge.to.visited == true) {

                        connectedEdge.to.visited = false
                    }
                }
            }

            currentNode.visited = true

            if !toVisit.isEmpty {

                currentNode = toVisit.min(by: { $0.distance < $1.distance } )!
            }

            if (currentNode.currency == destination) {

                currentNode.route += currentNode.currency
                return currentNode.route
            }
        }

        return currentNode.route
    }
}
