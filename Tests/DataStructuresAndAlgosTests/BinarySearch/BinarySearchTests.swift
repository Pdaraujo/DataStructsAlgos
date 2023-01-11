//
//  BinarySearchTests.swift
//  
//
//  Created by Diogo Araújo on 11/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class BinarySearchTests: XCTestCase {
	
	func testBinarySearch() throws {
		
		let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
		
		let first = array.firstIndex(of: 31)
		let bs = array.binarySearch(for: 31)
		
		XCTAssertTrue(bs == 7)
		XCTAssertTrue(bs == first)
	}
}


