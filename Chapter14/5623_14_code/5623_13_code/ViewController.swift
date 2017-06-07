//
//  ViewController.swift
//  5623_13_code
//
//  Created by Stuart Grimshaw on 14/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
  
  
  @IBAction func downloadTaskButtonClicked(_ sender: AnyObject)
  {
    let requestManager = HTTPRequestManager.sharedInstance
    requestManager.downloadRequest(urlString: "http://grimshaw.de/macOS-book/Small.pdf")
//    requestManager.downloadRequest(urlString: "http://grimshaw.de/macOS-book/Haskell.pdf")
  }
  
  @IBAction func cancelButtonClicked(_ sender: AnyObject)
  {
    let requestManager = HTTPRequestManager.sharedInstance
    requestManager.cancelDownloads()
  }
  
  @IBAction func suspendButtonClicked(_ sender: AnyObject)
  {
    let requestManager = HTTPRequestManager.sharedInstance
    requestManager.suspendDownloads()
  }
  
  @IBAction func resumeButtonClicked(_ sender: AnyObject)
  {
    let requestManager = HTTPRequestManager.sharedInstance
    requestManager.resumeDownloads()
  }
  
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

