//
//  LinkedListChallengesTests.swift
//
//
//  Created by Diogo Araújo on 28/10/2022.
//

import Foundation


import XCTest
@testable import DataStructuresAndAlgos

class LinkedListChallengesTests: XCTestCase {

    var stub: LinkedListChallenges!

    override func setUp() {

        super.setUp()

        self.stub = LinkedListChallenges()
    }

    override func tearDown() {

        self.stub = nil

        super.tearDown()
    }

    func testShowReverseValues() throws {

        var list = LinkedList<Int>()

        list.push(3)
        list.push(2)
        list.push(1)

        let order = Array([1, 2, 3].reversed())

        let result = self.stub.showReverseValues(linkedList: list)

        XCTAssertEqual(result, order)
    }

    func testFindMiddleNode() throws {

        var listOne = LinkedList<Int>()
        var listTwo = LinkedList<Int>()

        listOne.push(3)
        listOne.push(2)
        listOne.push(1)

        listTwo.push(4)
        listTwo.push(3)
        listTwo.push(2)
        listTwo.push(1)

        let middleOne = self.stub.findMiddleNode(linkedList: listOne)
        let middleTwo = self.stub.findMiddleNode(linkedList: listTwo)

        XCTAssertEqual(middleOne, 2)
        XCTAssertEqual(middleTwo, 3)
    }

    func testReverse() throws {

        var list = LinkedList<Int>()
        var reversed = LinkedList<Int>()

        reversed.push(3)
        reversed.push(2)
        reversed.push(1)

        list.push(3)
        list.push(2)
        list.push(1)

        XCTAssertEqual("\(list)", "\(reversed)")

        let result = self.stub.reverse(linkedList: list)
        reversed.reverse()

        XCTAssertEqual("\(result)", "\(reversed)")
    }

    func testMergeSorted() throws {

        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)

        var anotherList = LinkedList<Int>()
        anotherList.push(-1)
        anotherList.push(-2)
        anotherList.push(-3)

        let result = self.stub.mergeSorted(list, anotherList)

        XCTAssertEqual("\(result)", "-3 -> -2 -> -1 -> 1 -> 2 -> 3     ")
    }

    func testRemoveAll() throws {

        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(2)
        list.push(1)
        list.push(1)

        let result = self.stub.removeAll(3, in: list)

        XCTAssertEqual("\(result)", "1 -> 1 -> 2 -> 2   ")
    }

    func testMergeK() throws {

        class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
        }

        func createList(from nums: [Int]) -> ListNode? {

            let head = ListNode(nums[0])
            var current: ListNode? = head

            for i in 1..<nums.count {

                current?.next = ListNode(nums[i])
                current = current?.next
            }

            return head
        }

        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

            guard lists.isEmpty == false else { return nil }

            var newLists = lists

            while newLists.count > 1 {

                var mergedList = [ListNode?]()

                for i in stride(from: 0, to: newLists.count, by: 2) {

                    let list1 = newLists[i]

                    guard (i + 1) < newLists.count else {

                        mergedList.append(list1)
                        continue
                    }

                    let list2 = lists[i + 1]
                    let merged = merge(l1: list1, l2: list2)

                    mergedList.append(merged)
                }

                newLists = mergedList
            }

            if let node = newLists.first {

                return node
            }

            return nil
        }

        func merge(l1: ListNode?, l2: ListNode?) -> ListNode? {

            guard let l1 = l1 else { return l2 }
            guard let l2 = l2 else { return l1 }

            var current1: ListNode? = l1
            var current2: ListNode? = l2

            var head: ListNode?
            var current: ListNode?

            if l1.val > l2.val {

                head = current2
                current2 = current2?.next
            } else {

                head = current1
                current1 = current1?.next
            }

            current = head

            while let c1 = current1, let c2 = current2 {

                if c1.val > c2.val {

                    current?.next = current2
                    current2 = current2?.next
                } else {

                    current?.next = current1
                    current1 = current1?.next
                }

                current = current?.next
            }

            if current1 != nil {

                current?.next = current1
            }

            if current2 != nil {

                current?.next = current2
            }
            return head
        }

//        mergeKLists([createList(from: [1,4,5]),createList(from: [1,3,4]),createList(from: [2,6])])
    }
}
