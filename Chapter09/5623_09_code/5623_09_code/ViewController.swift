//
//  ViewController.swift
//  5623_09_code
//
//  Created by Stuart Grimshaw on 31/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBOutlet weak var buttonView: ButtonView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    buttonView.roundIcon = false

    // Do any additional setup after loading the view.
  }

  @IBOutlet weak var custonButtonClicked: ButtonView!
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

