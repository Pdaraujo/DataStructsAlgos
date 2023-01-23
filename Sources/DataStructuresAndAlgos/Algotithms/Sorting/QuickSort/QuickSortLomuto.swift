//
//  QuickSortLomuto.swift
//  
//
//  Created by Diogo Araújo on 27/01/2023.
//

import Foundation

public func quickSortLomuto<Element: Comparable>(_ a: inout [Element], low: Int, high: Int) {

    if low < high {

        let pivot = partitionLomuto(&a, low: low, high: high)
        quickSortLomuto(&a, low: low, high: pivot - 1)
        quickSortLomuto(&a, low: pivot + 1, high: high)
    }
}

func partitionLomuto<Element: Comparable>(_ a: inout [Element], low: Int, high: Int) -> Int {

    let pivot = a[high]
    var i = low

    for j in i..<high {

        if a[j] <= pivot {

            a.swapAt(i, j)
            i += 1
        }
    }

    a.swapAt(i, high)
    return i
}

