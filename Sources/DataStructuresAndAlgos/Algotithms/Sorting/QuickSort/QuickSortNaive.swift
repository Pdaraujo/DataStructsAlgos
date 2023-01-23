//
//  QuickSortNaive.swift
//  
//
//  Created by Diogo Araújo on 27/01/2023.
//

import Foundation

public func quickSortNaive<Element: Comparable>(_ array: [Element]) -> [Element] {

    guard array.count > 1 else { return array }

    let pivot = array[array.count / 2]

    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }

    return quickSortNaive(less) + equal + quickSortNaive(greater)
}
