//
//  String.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

extension String {
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
}
