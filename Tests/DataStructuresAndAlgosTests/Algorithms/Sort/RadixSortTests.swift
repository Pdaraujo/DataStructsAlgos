//
//  RadixSortTests.swift
//  
//
//  Created by Diogo Araújo on 23/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class RadixSortTests: XCTestCase {

    func testDefault() throws {

        var array = [9, 4, 10, 23, 3, 15, 12, 7]
        array.radixSort()

        let expected = [3,4,7,9,10,12,15,23]

        XCTAssert(expected == array)
    }

    func testlexicographicalSort() throws {

        var array = [9, 4, 10, 23, 3, 15, 12, 7]
        array.lexicographicalSort()

        let expected = [10,12,15,23,3,4,7,9]

        XCTAssert(expected == array)
    }
}
