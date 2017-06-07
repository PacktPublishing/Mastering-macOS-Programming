//
//  Ops.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 26/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

func ops1()
{
  let someClosure = {print("someClosure")}
  let opQueue = OperationQueue()
  
  opQueue.addOperation(someClosure)
}

func ops2()
{
  let opQueue = OperationQueue()
  
  for index in 0..<3
  {
    opQueue.addOperation({print("index = \(index)")})
  }
}

func ops3()
{
  let opQueue = OperationQueue()
  let cleanUpOp = BlockOperation(block: {print("Cleaning up")})
  
  for index in 0..<3
  {
    let blockOp = BlockOperation(block:
      {print("index = \(index)")})
    
    cleanUpOp.addDependency(blockOp)
    opQueue.addOperation(blockOp)
  }
  
  opQueue.addOperation(cleanUpOp)
}

func ops4()
{
  let opQueue = OperationQueue()
  
  for index in 0..<3
  {
    let blockOp = BlockOperation()
    
    blockOp.addExecutionBlock({print("index = \(index)")})
    blockOp.addExecutionBlock {
      Thread.sleep(forTimeInterval: 1.5)
      print("post-snooze Block \(index)")
    }
    
    opQueue.addOperation(blockOp)
  }
}

func ops5()
{
  let opQueue = OperationQueue()
  
  for index in 0..<3
  {
    let blockOp = BlockOperation(block:
      {print("index = \(index)")})
    
    blockOp.addExecutionBlock {
      Thread.sleep(forTimeInterval: 1.5)
      print("post-snooze Block \(index)")
    }
    
    blockOp.completionBlock =
      {print("blockOp \(index) complete")}
    
    opQueue.addOperation(blockOp)
  }
}
