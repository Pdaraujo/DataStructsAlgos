//
//  Edge.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public struct Edge<T> {

    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}
