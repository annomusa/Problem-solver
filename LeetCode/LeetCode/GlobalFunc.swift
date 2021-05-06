//
//  GlobalFunc.swift
//  LeetCode
//
//  Created by Anno Musa on 03/05/21.
//

import Foundation

func log(file: String = #file, _ items: Any...) {
    
    print("\(file.split(separator: "/").last!):", items)
}
