//
//  QuickSortMedian.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public func quickSortMedian<T: Comparable>(_ a: inout [T], low: Int, high: Int) {

    if low < high {

        let pivotIndex = medianOfThree(&a, low: low, high: high)
        a.swapAt(pivotIndex, high)

        let pivot = partitionLomuto(&a, low: low, high: high)
        quickSortLomuto(&a, low: low, high: pivot - 1)
        quickSortLomuto(&a, low: pivot + 1, high: high)
    }
}

func medianOfThree<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {

    let center = (low + high) / 2

    if a[low] > a[high] {

        a.swapAt(low, high)
    }

    if a[center] > a[high] {

        a.swapAt(center, high)
    }

    return center
}
