//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Dylan Schwartz on 8/30/18.
//  Copyright © 2018 Dylan Schwartz. All rights reserved.
//

import Foundation

class Stopwatch {
  
  init() {
    
  }
  
  private var startTime: NSDate?
  
  var elapsedTime: TimeInterval {
    if let startTime = self.startTime {
      return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
    } else {
      return 0
    }
  }
  
  func start() {
    startTime = NSDate()
  }
  
  func stop() {
    startTime = nil
  }
  
  var elapsedTimeAsString: String {
    let diffHours = Int((elapsedTime.truncatingRemainder(dividingBy: 86400))/(3600))
    let diffMinutes = Int((elapsedTime.truncatingRemainder(dividingBy: 86400))/(60)) - diffHours * 60
    let diffSeconds = Int((elapsedTime.truncatingRemainder(dividingBy: 86400))) - diffMinutes * 60 - diffHours * 3600
    let diffMicro = Int(((elapsedTime * 100).rounded() / 100 - Double(Int(elapsedTime))) * 10)
    let diffTimeString: String = String(format: "%02d:%02d.%01d", diffMinutes, diffSeconds, diffMicro)
    return diffTimeString
  }
  
  var isRunning: Bool {
    return !(startTime == nil)
  }
  
}
