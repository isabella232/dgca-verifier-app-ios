//
//  Data+hexString.swift
//  PatientScannerDemo
//
//  Created by Yannick Spreen on 4/14/21.
//

import Foundation

extension Data {
  init?(hexString: String) {
    let len = hexString.count / 2
    var data = Data(capacity: len)
    var i = hexString.startIndex
    for _ in 0..<len {
      let j = hexString.index(i, offsetBy: 2)
      let bytes = hexString[i..<j]
      if var num = UInt8(bytes, radix: 16) {
        data.append(&num, count: 1)
      } else {
        return nil
      }
      i = j
    }
    self = data
  }

  var uint: [UInt8] { [UInt8](self) }
  var hexString: String {
    let format = "%02hhx"
    return self.map { String(format: format, $0) }.joined()
  }
}
