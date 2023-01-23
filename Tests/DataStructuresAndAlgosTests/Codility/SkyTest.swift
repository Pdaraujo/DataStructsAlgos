//
//  SkyTest.swift
//  
//
//  Created by Diogo Araújo on 27/02/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class SkyTest: XCTestCase {

    func testCenas() throws {

       func solution(_ message : inout String, _ K : Int) -> String {

            var words = message.split(separator: " ")

            while words.count > 0, words.joined(separator: " ").count > K {

                words.removeLast()
            }

            return words.isEmpty ? "" : words.joined(separator: " ")
        }

        var test = "Codility We test coders"

        let response = solution(&test, 2)

        XCTAssertTrue(response == "")
    }

    func testXCenas2() throws {

        func solution(_ A : inout [String], _ B : inout [String], _ P : inout String) -> String {

            typealias PhoneContact = (name: String, number: String)
            var phoneContacts: [PhoneContact] = []

            // A and B have same length
            for i in 0..<A.count {

                phoneContacts.append((name: A[i], number: B[i]))
            }

            let filtered = phoneContacts.filter { $0.number.contains(P) }

            guard filtered.isEmpty == false else { return "NO CONTACT"}

            return filtered.sorted { $0.name < $1.name }.first?.name ?? ""
        }
    }

    func testCenas3() throws {

        func solution(_ A : inout [Int], _ K : Int, _ L : Int) -> Int {

            let count = A.count

            if K + L > count {

                return -1
            }

            let maxTrees = max(K, L)
            let minTrees = min(K, L)

            var maxSumForMaxTrees = 0
            var indexForMaxTrees = -1

            var maxSumForMinTrees = 0

            // We find the first range, which is the bigger range of Trees
            for i in 0...(count - maxTrees) {

                let sum = Array(A[i...i + maxTrees - 1]).reduce(0, +)

                if sum > maxSumForMaxTrees {

                    maxSumForMaxTrees = sum
                    indexForMaxTrees = i
                }
            }

            // we find the second range which is the min range
            for i in 0...(count - minTrees) {

                // we don't want to check inside the maxTrees range
                if i >= indexForMaxTrees && i <= (indexForMaxTrees + maxTrees) { continue }

                let sum = Array(A[i...i + minTrees - 1]).reduce(0, +)
                maxSumForMinTrees = max(maxSumForMinTrees, sum)
            }

            return maxSumForMaxTrees + maxSumForMinTrees
        }

        var a = [6, 1, 4, 6, 3, 2, 7, 4]// [6,1,4,6,3,2,7,4,6,1,4,6,3, 2,7,4]
        let K = 3
        let L = 2

        let response = solution(&a, K, L)
        print(response)
        XCTAssertTrue(response == 24)
    }

}
