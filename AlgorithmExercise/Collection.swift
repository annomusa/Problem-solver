//
//  Collection.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array {
    func scan<T>(initial: T, _ f: (T, Element) -> T) -> [T] {
        return self.reduce([initial], { (listSoFar: [T], next: Element) -> [T] in
            // because we seeded it with a non-empty
            // list, it's easy to prove inductively
            // that this unwrapping can't fail
            let lastElement = listSoFar.last!
            return listSoFar + [f(lastElement, next)]
        })
    }
}
