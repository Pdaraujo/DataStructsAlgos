//
//  HeapSort.swift
//  
//
//  Created by Diogo Araújo on 27/01/2023.
//

public extension Heap {

    func sorted() -> [Element] {

        var heap = Heap(elements: self.elements, sort: sort)

        for index in heap.elements.indices.reversed() {

            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }

        return heap.elements
    }
}
