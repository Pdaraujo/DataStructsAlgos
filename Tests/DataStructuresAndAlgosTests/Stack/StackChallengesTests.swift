//
//  StackChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 26/10/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

class StackChallengesTests: XCTestCase {

    var stub: StackChallenges!

    override func setUp() {

        super.setUp()

        self.stub = StackChallenges()
    }

    override func tearDown() {

        self.stub = nil

        super.tearDown()
    }

    func testReverse() throws {

        let array = [1, 2, 3, 4, 5]
        let response = self.stub.reverse(array)

        XCTAssertEqual(response, "54321")
    }

    func testBalancedParenthesis() throws {

        let textOne = "h((e))llo(world)()"
        let textTwo = "(hello world"

        let responseOne = self.stub.balancedParenthesis(textOne)
        let responseTwo = self.stub.balancedParenthesis(textTwo)

        XCTAssertTrue(responseOne)
        XCTAssertFalse(responseTwo)
    }

    func testEvaluateReversePolishNotation() throws {

        let result = self.stub.evalRPN(["2","1","+","3","*"])

        XCTAssertTrue(result == 9)
    }
}
