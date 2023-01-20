//
//  InsertionSortTests.swift
//  
//
//  Created by Diogo Araújo on 20/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class InsertionSortTests: XCTestCase {

    func testDefault() throws {

        var array = [9, 4, 10, 3]

        insertionSort(&array)

        let expected = [3,4,9,10]

        XCTAssert(expected == array)
    }
}
