//
//  Counter.swift
//  Widget
//
//  Created by Renan Machado on 27/09/20.
//

import Foundation

@objc(Counter)
class Counter: NSObject {
  
  @objc
  func constantsToExport() -> [AnyHashable : Any]! {
    return ["initialCount": 0]
  }
  
}
