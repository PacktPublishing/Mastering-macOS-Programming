//
//  Bee.swift
//  5623_06_Code
//
//  Created by Stuart Grimshaw on 5/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import AppKit

class Bee: NSObject
{
    dynamic var name: String
    var busy: Bool
    dynamic var shoeColor: NSColor
    dynamic var busyString: String{
        return busy ? "Busy" : "Not busy"
    }
    
    init(name: String,
         busy:Bool,
         shoeColor: NSColor)
    {
        self.name = name
        self.busy = busy
        self.shoeColor = shoeColor
        
        super.init()
    }
}
