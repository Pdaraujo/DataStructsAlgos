//
//  QuickSortTests.swift
//  
//
//  Created by Diogo Araújo on 27/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class QuickSortTests: XCTestCase {

    func testNaive() throws {

        let array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        let result = quickSortNaive(array)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == result)
    }

    func testLomuto() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        quickSortLomuto(&array, low: 0, high: array.count - 1)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }

    func testHoare() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        quicksortHoare(&array, low: 0, high: array.count - 1)

        print(array)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }

    func testMedian() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        quickSortMedian(&array, low: 0, high: array.count - 1)

        print(array)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }

    func testDutchFlag() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        quickSortDutchFlag(&array, low: 0, high: array.count - 1)

        print(array)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }
}
