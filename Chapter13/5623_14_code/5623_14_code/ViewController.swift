//
//  ViewController.swift
//  5623_14_code
//
//  Created by Stuart Grimshaw on 4/12/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
//  var managedContext = (NSApplication.shared().delegate as! AppDelegate).managedObjectContext
  var managedContext = (NSApplication.shared().delegate as! AppDelegate).persistentContainer.viewContext

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

