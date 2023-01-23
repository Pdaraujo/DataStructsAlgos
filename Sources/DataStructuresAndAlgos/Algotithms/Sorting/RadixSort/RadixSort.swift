//
//  RadixSort.swift
//  
//
//  Created by Diogo Araújo on 23/01/2023.
//

import Foundation

extension Array where Element == Int {

    mutating func radixSort() {

        let base = 10

        var done = false
        var digits = 1

        while done == false {

            done = true

            var buckets: [[Int]] = .init(repeating: [], count: base)

            forEach { number in

                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)

                if remainingPart > 0 {

                    done = false
                }
            }

            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
}
//Challenge 1: Most significant digit
//Open the starter playground for this chapter to begin.
//The implementation discussed in the chapter used a least significant digit radix sort. Your task is to implement a most significant digit radix sort.
//This sorting behavior is called lexicographical sorting and is also used for String sorting.
extension Array where Element == Int {

    mutating func lexicographicalSort() {

        self = msdRadixSorted(self, 0)
    }

    private func msdRadixSorted(_ array: [Int], _ position: Int) -> [Int] {

        guard position < array.maxDigits else { return array }

        var buckets: [[Int]] = .init(repeating: [], count: 10)

        var priorityBucket: [Int] = []

        array.forEach { number in

            guard let digit = number.digit(atPosition: position) else {

              priorityBucket.append(number)
              return
            }

            buckets[digit].append(number)
        }

        priorityBucket.append(contentsOf: buckets.reduce(into: []) { result, bucket in

          guard !bucket.isEmpty else { return }
          result.append(contentsOf: msdRadixSorted(bucket, position + 1))
        })

        return priorityBucket
    }

    private var maxDigits: Int { self.max()?.digits ?? 0 }
}

private extension Int {

    var digits: Int {

        var count = 0

        var num = self

        while num != 0 {

            count += 1
            num /= 10
        }

        return count
    }

    func digit(atPosition position: Int) -> Int? {

        guard position < digits else { return nil }

        var num = self
        let correctPosition = Double(position + 1)

        while num / Int(pow(10.0, correctPosition)) != 0 {

            num /= 10
        }

        return num % 10
    }
}
