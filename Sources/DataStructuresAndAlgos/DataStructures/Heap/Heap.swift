//
//  Heap.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import Foundation

public struct Heap<Element: Equatable> {
    
    private(set) var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    public init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {
        
        self.sort = sort
        self.elements = elements

        // The initializer now takes an additional parameter. If a non-empty array is provided, you use this as the element for the heap. To satisfy the heap’s property, you loop through the array backward, starting from the first non-leaf node, and sift down all parent nodes. You loop through only half of the elements because there is no point in sifting down leaf nodes, only parent nodes.
        self.buildHeap()
    }
}

public extension Heap {
    
    var isEmpty: Bool { self.elements.isEmpty }
    
    var count: Int { self.elements.count }
    
    func peek() -> Element? { self.elements.first }
    
    func leftChildIndex(ofParentAt index: Int) -> Int { 2 * index + 1 }
    
    func rightChildIndex(ofParentAt index: Int) -> Int { 2 * index + 2 }
    
    func parentIndex(ofChildAt index: Int) -> Int { (index - 1) / 2 }
}

public extension Heap {
    
    mutating func insert(_ element: Element) {
        
        self.elements.append(element)
        
        siftUp(from: self.count - 1)
    }
    
    mutating func remove() -> Element? {
        
        guard self.isEmpty == false else { return nil }
        
        self.elements.swapAt(0, self.count - 1)
        
        defer { self.siftDown(from: 0) }
        
        return self.elements.removeLast()
    }
    
    mutating func remove(at index: Int) -> Element? {
        
        guard index < self.count else { return nil }
        
        if index == self.count - 1 {
            
            return self.elements.removeLast()
            
        } else {
            
            self.elements.swapAt(index, self.count - 1)
            
            defer {
                // perform a sift down and a sift up to adjust the heap
                self.siftDown(from: index)
                self.siftUp(from: index)
            }
            
            return self.elements.removeLast()
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        
        if i >= count { return nil }
        
        if sort(element, elements[i]) { return nil }
        
        if element == elements[i] {
            
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            
            return j
        }
        
        return nil
    }

    mutating func merge(_ heap: Heap) {

        self.elements = self.elements + heap.elements
        self.buildHeap()
    }
}

private extension Heap {

    mutating func buildHeap() {

        if elements.isEmpty == false {

            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    mutating func siftDown(from index: Int) {
        
        var parent = index
        
        while true {
            
            let left = self.leftChildIndex(ofParentAt: parent)
            let right = self.rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < self.count && self.sort(self.elements[left], self.elements[candidate]) {
                
                candidate = left
            }
            
            if right < self.count && self.sort(self.elements[right], self.elements[candidate]) {
                
                candidate = right
            }
            
            if parent == candidate { return }
            
            self.elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func siftUp(from index: Int) {
        
        var child = index
        var parent = self.parentIndex(ofChildAt: child)
        
        while child > 0 && self.sort(self.elements[child], self.elements[parent]) {
            
            self.elements.swapAt(child, parent)
            child = parent
            parent = self.parentIndex(ofChildAt: child)
        }
    }
}
