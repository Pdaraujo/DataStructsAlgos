//
//  MergeSortTests.swift
//  
//
//  Created by Diogo Araújo on 23/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class MergeSortTests: XCTestCase {

    func testDefault() throws {

        let array = [9, 4, 10, 23, 3, 15, 12, 7]

        let response = mergeSort(array)

        let expected = [3,4,7,9,10,12,15,23]

        XCTAssert(expected == response)
    }
}
