//
//  ProtocolClass.swift
//  ProtocolAFPEexample
//
//  Created by vincent schmitt on 03/03/2021.
//

import Foundation

class Ordered {
  func precedes(other: Ordered) -> Bool { fatalError("implement me!") }
}
class Number : Ordered {
  var value: Double = 0
  override func precedes(other: Ordered) -> Bool {
    return self.value < (other as! Number).value
  }
}
