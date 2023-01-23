//
//  QuickSortChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 28/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class QuickSortChallengesTests: XCTestCase {

    func testIterativeLomuto() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        quickSortIterativeLomuto(&array, low: 0, high: array.count - 1)

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }

    func testInCollection() throws {

        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

        array.quickSort()

        let expected = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]

        XCTAssert(expected == array)
    }

}
