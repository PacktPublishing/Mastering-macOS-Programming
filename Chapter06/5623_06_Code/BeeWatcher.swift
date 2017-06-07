//
//  BeeWatcher.swift
//  5623_06_Code
//
//  Created by Stuart Grimshaw on 5/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import AppKit

class BeeWatcher: NSObject
{
    private var myContext = 0
    var myBee: Bee

    init(bee:Bee)
    {
        self.myBee = bee
        super.init()
        
        myBee.addObserver(self,
                          forKeyPath: "busy",
                          options: [.new],
                          context: &myContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?)
    {
        if context == &myContext {
            if let keyPath = keyPath
            {
                print("\(keyPath) has changed to",
                      "\(change![NSKeyValueChangeKey.newKey]!)")
            }
        }
    }
    
    deinit
    {
        removeObserver(self,
                       forKeyPath: "busy",
                       context: &myContext)
    }
}
