//
//  AsyncCustomOp.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 26/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class ConcurrentOperation: Operation
{
  enum State: String {
    case Ready, Executing, Finished
    var keyPath: String {
      return "is" + rawValue
    }
  }
  
  var state = State.Ready {
    willSet {
      willChangeValue(forKey: newValue.keyPath)
      willChangeValue(forKey: state.keyPath)
    }
    didSet {
      didChangeValue(forKey: oldValue.keyPath)
      didChangeValue(forKey: state.keyPath)
    }
  }
  
  override var isReady: Bool {
    return super.isReady && state == .Ready
  }
  override var isExecuting: Bool {
    return state == .Executing
  }
  override var isFinished: Bool {
    return state == .Finished
  }
  override var isAsynchronous: Bool {
    return true
  }
  
  override func start()
  {
    if isCancelled {
      state = .Finished
      return
    }
    main()
    state = .Executing
  }
  
  override func cancel() {
    state = .Finished
  }
}
