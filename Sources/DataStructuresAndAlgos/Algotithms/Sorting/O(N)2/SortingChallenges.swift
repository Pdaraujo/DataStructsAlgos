//
//  SortingChallenges.swift
//  
//
//  Created by Diogo Araújo on 23/01/2023.
//

import Foundation

final public class SortingChallenges {}

// Challenge 1: Group elements
// Given a collection of Equatable elements, bring all instances of a given value to the right side of the collection.
extension MutableCollection where Self: BidirectionalCollection, Element: Equatable {

    mutating func rightAlign(value: Element) {

        var left = startIndex
        var right = index(before: endIndex)

        while left < right {

            while self[right] == value {

                formIndex(before: &right)
            }

            while self[left] != value {

                formIndex(after: &left)
            }

            guard left < right else { return }

            swapAt(left, right)
        }
    }
}
//Challenge 2: Find a duplicate
//Given a collection of Equatable (and Hashable) elements, return the first element that is a duplicate in the collection.
extension Sequence where Element: Hashable {

    var firstDuplicate: Element? {

        var set: Set<Element> = []

        for value in self {

            if set.contains(value) { return value }

            set.insert(value)
        }

        return nil
    }
}

//Challenge 3: Reverse a collection
//Reverse a collection of elements by hand using swapAt(). Do not rely on the reverse or reversed methods.
extension MutableCollection where Self: BidirectionalCollection {

    mutating func reverse() {
        
        var left = startIndex
        var right = index(before: endIndex)

        while left < right {

            swapAt(left, right)

            formIndex(after: &left)
            formIndex(before: &right)
        }
    }
}
