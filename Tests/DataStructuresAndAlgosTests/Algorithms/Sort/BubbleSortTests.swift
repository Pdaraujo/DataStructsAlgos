//
//  BubbleSortTests.swift
//  
//
//  Created by Diogo Araújo on 20/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class BubbleSortTests: XCTestCase {

    func testDefault() throws {

        var array = [9, 4, 10, 3]

        bubbleSort(&array)

        let expected = [3,4,9,10]

        XCTAssert(expected == array)
    }
}
