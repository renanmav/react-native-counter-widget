import Foundation

@objc(Counter)
class Counter: RCTEventEmitter {
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  override func supportedEvents() -> [String]! {
    return ["onIncrement"]
  }
  
  public var value = 0
  
  override func constantsToExport() -> [AnyHashable : Any]! {
    return [
      "value": value,
    ]
  }
  
  @objc
  func increment() {
    value += 1
    
    sendEvent(withName: "onIncrement", body: ["value": value])
  }
  
}
