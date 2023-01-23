//
//  QuickSortChallenges.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public final class QuickSortChallenges {}

// Challenge 1: Iterative QuickSort
// In this chapter, you learned how to implement QuickSort recursively. Your challenge here is to implement it iteratively. Choose any partition strategy you learned in this chapter.
public func quickSortIterativeLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {

    var stack = Stack<Int>()

    stack.push(low)
    stack.push(high)

    while stack.isEmpty == false {

        guard let end = stack.pop(), let start = stack.pop() else { continue }

        let p = partitionLomuto(&a, low: start, high: end)

        if(p - 1) > start {

            stack.push(start)
            stack.push(p - 1)
        }

        if (p + 1) < end {

            stack.push(p + 1)
            stack.push(end)
        }
    }
}

// Challenge 2: Merge sort or Quicksort
// Explain when and why you would use merge sort over Quicksort.

// Solution to Challenge 2
// Merge sort is preferable over Quicksort when you need stability. Merge sort is stable and guarantees O(n log n). These characteristics are not the case with Quicksort, which isn’t stable and can perform as bad as O(n²).
// Merge sort works better for larger data structures or data structures where elements are scattered throughout memory. Quicksort works best when elements are stored in a contiguous block.

// Challenge 3: Partitioning with Swift standard library
// Implement Quicksort using the partition(by:) function that is part of the Swift standard library.

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {

    mutating func quickSort() {

        quickSortLomuto(low: startIndex, high: index(before: endIndex))
    }

    private mutating func quickSortLomuto(low: Index, high: Index) {

        if low <= high {

            let pivotValue = self[high]
            var p = self.partition { $0 > pivotValue }

            if p == endIndex {

                p = index(before: p)
            }

            self[..<p].quickSortLomuto(low: low, high: index(before: p))
            self[p...].quickSortLomuto(low: index(after: p), high: high)
        }
    }
}
