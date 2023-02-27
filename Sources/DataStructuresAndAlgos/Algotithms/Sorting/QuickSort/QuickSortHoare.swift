//
//  QuickSortHoare.swift
//
//
//  Created by Diogo Araújo on 27/01/2023.
//

import Foundation

public func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {

    if low < high {

        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}

func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {

    let pivot = a[low]
    var i = low - 1
    var j = high + 1

    while true {

        repeat { j -= 1 } while a[j] > pivot

        repeat { i += 1 } while a[i] < pivot

        if i < j {

            a.swapAt(i, j)

        } else {

            return j
        }
    }
}
