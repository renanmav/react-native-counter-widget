import Foundation
import SwiftUI
import WidgetKit

@available(iOS 14.0, *)
@objc(Counter)
class Counter: RCTEventEmitter {
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  override func supportedEvents() -> [String]! {
    return ["onIncrement"]
  }
  
  @AppStorage("counter", store: UserDefaults(suiteName: "group.com.renanmav.Widget"))
  var count: Int = Int()
  
  override func constantsToExport() -> [AnyHashable : Any]! {
    return [
      "value": count,
    ]
  }
  
  @objc
  func increment() {
    count += 1
    
    WidgetCenter.shared.reloadTimelines(ofKind: "SimpleWidget")
    
    sendEvent(withName: "onIncrement", body: ["value": count])
  }
  
}
