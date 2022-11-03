//
//  LinkedListChallenges.swift
//  
//
//  Created by Diogo Araújo on 28/10/2022.
//

import Foundation

public class LinkedListChallenges {}

/// Challenge 1: Print in reverse
/// Create a function that prints the nodes of a linked list in reverse order.
///
///  For example:
///
///  1 -> 2 -> 3 -> nil
///
/// should print out the following:
/// //3
/// //2
/// //1
extension LinkedListChallenges {

    func showReverseValues<T>(linkedList: LinkedList<T>) -> [T] {

        var result: [T] = []

        func addInReverse(_ node: LinkedList<T>.Node<T>?) {

            guard let node = node else { return }
            addInReverse(node.next)
            result.append(node.value)
        }

        addInReverse(linkedList.head)

        return result
    }
}

/// Challenge 2: Find the middle node
/// Create a function that finds the middle node of a linked list.
///
/// For example:
///
/// 1 -> 2 -> 3 -> 4 -> nil
/// //middle is 3
///
/// 1 -> 2 -> 3 -> nil
/// // middle is 2

extension LinkedListChallenges {

    func findMiddleNode<T>(linkedList: LinkedList<T>) -> T {

        var fastPointer = linkedList.head
        var slowPointer = linkedList.head

        while let fastNode = fastPointer?.next {

            fastPointer = fastNode.next
            slowPointer = slowPointer?.next
        }

        return slowPointer!.value
    }
}

/// Challenge 3: Reverse a linked list
/// Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
///
/// For example:
///
/// // before
/// 1 -> 2 -> 3 -> nil
///
/// // after
/// 3 -> 2 -> 1 -> nil
extension LinkedListChallenges {

    func reverse<T>(linkedList: LinkedList<T>) -> LinkedList<T> {

        var reversed = linkedList
        reversed.reverse()

        return reversed
    }
}

/// Challenge 4: Merge two lists
/// Create a function that takes two sorted linked lists and merges them into a single sorted linked list.
/// Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
///
/// For example:
///
/// // list1
/// 1 -> 4 -> 10 -> 11
///
/// // list2
/// -1 -> 2 -> 3 -> 6
///
/// // merged list
/// -1 -> 1 -> 2 -> 3 -> 4 -> 6 -> 10 -> 11
extension LinkedListChallenges {

    func mergeSorted<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {

        guard left.isEmpty == false else { return right }
        guard right.isEmpty == false else { return left }

        var newHead: LinkedList<T>.Node<T>?
        var newTail: LinkedList<T>.Node<T>?

        var currentLeft = left.head
        var currentRight = right.head

        if let leftNode = currentLeft, let rightNode = currentRight {

            if leftNode.value < rightNode.value {

                newHead = leftNode
                currentLeft = leftNode.next
            } else {

                newHead = rightNode
                currentRight = rightNode.next
            }

            newTail = newHead
        }

        while let leftNode = currentLeft, let rightNode = currentRight {

            if leftNode.value < rightNode.value {

                newTail?.next = leftNode
                currentLeft = leftNode.next
            } else {

                newTail?.next = rightNode
                currentRight = rightNode.next
            }

            newTail = newTail?.next
        }

        if let leftNodes = currentLeft {
            newTail?.next = leftNodes
        }

        if let rightNodes = currentRight {
            newTail?.next = rightNodes
        }

        var newList = LinkedList<T>()
        newList.head = newHead
        newList.tail = {

            while let next = newTail?.next {

                newTail = next
            }

            return newTail
        }()

        return newList
    }
}


/// Challenge 5: Remove all occurrences
/// Create a function that removes all occurrences of a specific element from a linked list.
/// The implementation is similar to the remove(at:) method you implemented for the linked list.
///
/// For example:
///
/// // original list
/// 1 -> 3 -> 3 -> 3 -> 4
///
/// // list after removing all occurrences of 3
/// 1 -> 4
extension LinkedListChallenges {


    func removeAll<T: Comparable>(_ value: T, in list: LinkedList<T>) -> LinkedList<T> {

        var listCopy = list

        if listCopy.head?.value == value {

            listCopy.head = listCopy.head?.next
        }

        var prev = listCopy.head
        var current = listCopy.head?.next

        while let currentNode = current {

            guard currentNode.value != value else {

                prev?.next = currentNode.next
                current = prev?.next
                continue
            }

            prev = currentNode
            current = currentNode.next
        }

        listCopy.tail = prev

        return listCopy
    }
}
