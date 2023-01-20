//
//  PriorityQueueChallenges.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import Foundation

public class PriorityQueueChallenges {}

// Challenge 1: Array-based priority queue

// You have learned to use a heap to construct a priority queue by conforming to the Queue protocol. Now, construct a priority queue using an Array.
public extension PriorityQueueChallenges {

    struct PriorityQueueArray<T: Equatable>: Queue {

        private var elements: [T] = []
        let sort: (T, T) -> Bool

        public init(sort: @escaping (T, T) -> Bool,
                    elements: [T] = []) {
            self.sort = sort
            self.elements = elements
            self.elements.sort(by: sort)
        }

        public var isEmpty: Bool {
            elements.isEmpty
        }

        public var peek: T? {
            elements.first
        }

        public mutating func enqueue(_ element: T) -> Bool {
            for (index, otherElement) in elements.enumerated() {
                if sort(element, otherElement) {
                    elements.insert(element, at: index)
                    return true
                }
            }
            elements.append(element)
            return true
        }

        public mutating func dequeue() -> T? {
            isEmpty ? nil : elements.removeFirst()
        }
    }
}

// Challenge 2: Prioritize a waitlist

// Your favorite T-Swift concert was sold out. Fortunately, there is a waitlist for people who still want to go! However, ticket sales will first prioritize someone with a military background, followed by seniority. Write a sort function that will return the list of people on the waitlist by the priority mentioned.
public extension PriorityQueueChallenges {

    struct Person: Equatable {
      let name: String
      let age: Int
      let isMilitary: Bool
    }

    func sort(person1: Person, person2: Person) -> Bool {

        if person1.isMilitary == person2.isMilitary {

            return person1.age > person2.age
        }

        return person1.isMilitary
    }
}
