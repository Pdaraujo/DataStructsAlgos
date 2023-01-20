//
//  HeapChallenges.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import Foundation

public class HeapChallenges {}

// Challenge 1: Find the nth smallest integer

// Write a function to find the nth smallest integer in an unsorted array. For example:

// let integers = [3, 10, 18, 5, 21, 100]
// If n = 3, the result should be 10.
public extension HeapChallenges {

    // Building a heap takes O(n). Every element removal from the heap takes O(log n). Keep in mind that you are also doing this n times. The overall time complexity is O(n log n).
    func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {

        var heap = Heap(elements: elements, sort: <)

        var current = 1

        while heap.isEmpty == false {

            let element = heap.remove()!

            if current == n {

                return element
            }

            current += 1
        }

        return nil
    }
}

// Challenge 3: Combining two heaps

// Write a method that combines two heaps.
public extension HeapChallenges {

    func merge<T>(_ heap1: Heap<T>, _ heap2: Heap<T>) -> Heap<T> {

        var heap = heap1
        heap.merge(heap2)

        return heap
    }
}

// Challenge 4: A Min Heap?

// Write a function to check if a given array is a min-heap.
public extension HeapChallenges {

    func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool {

        guard !elements.isEmpty else { return true }

        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {

            let left = self.leftChildIndex(ofParentAt: i)
            let right = self.rightChildIndex(ofParentAt: i)

            if elements[left] < elements[i] { return false }

            if right < elements.count && elements[right] < elements[i]  { return false }
        }

        return true
    }
}

private extension HeapChallenges {

    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }

    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
}
