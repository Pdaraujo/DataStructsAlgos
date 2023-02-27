//
//  QuickSortDutchFlag.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import Foundation

public func quickSortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {

    if low < high {

        let (middleFirst, middleLast) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: high)

        quickSortDutchFlag(&a, low: low, high: middleFirst - 1)
        quickSortDutchFlag(&a, low: middleLast + 1, high: high)
    }
}

func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {

    let pivot = a[pivotIndex]

    var smaller = low
    var equal = low
    var larger = high

    while equal <= larger {

        if a[equal] < pivot {

            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {

            equal += 1
        } else {

            a.swapAt(equal, larger)
            larger -= 1
        }
    }

    return (smaller, larger)
}
