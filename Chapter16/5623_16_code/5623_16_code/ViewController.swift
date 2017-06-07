//
//  ViewController.swift
//  5623_16_code
//
//  Created by Stuart Grimshaw on 29/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
  override func viewDidLoad()
  {
    super.viewDidLoad()
//    testBreakpoints()
    testStepCommands()
  }
  
  
  func testBreakpoints()
  {
    // Log Message
    var total = 0
    for _ in 0..<5
    {
      total += 1
    }
    
    // Debugger Command
    let s = "Doug"
    let i = 42
    let b = true
    
    var option = "Debugger Command"
    
    // Shell Command
    option = "Shell Command"
    
    // AppleScript
    option = "AppleScript alert"
    option = "AppleScript mail"
    
  }
  
  func testStepCommands()
  {
    func printObservation()
    {
      print("Today you are you!")
      print("That is truer than true!")
      print("There is no one alive who is you-er than you!")
    }
    
    func printPrediction()
    {
      print("And will you succeed?")
      print("Yes you will indeed!")
      print("98 and 3/4 percent guaranteed.")
    }
    
    printObservation()
    printPrediction()
    
  }
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

