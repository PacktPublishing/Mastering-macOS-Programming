//
//  ViewController.swift
//  5623_06_Code
//
//  Created by Stuart Grimshaw on 5/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import AppKit

class ViewController: NSViewController
{
    var theBeeWatcher: BeeWatcher?
    var beesArray: [Bee] = [
        Bee(name: "Bowie", busy: true, shoeColor: .red),
        Bee(name: "Zappa", busy: false, shoeColor: .brown)
    ]

    @IBOutlet var beesArrayController: NSArrayController!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setUpTheBeeWatcher()
        
        queueUpChanges()
    }
    
    func queueUpChanges()
    {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 2.0,execute: {
            self.beesArrayController.addObject(Bee(
                name: "Elvis",
                busy: true,
                shoeColor: .blue))
                
            print(self.beesArray)
        })
    }
    
    func setUpTheBeeWatcher()
    {
        let theBee = Bee(name: "Melanie",
                         busy: true,
                         shoeColor: NSColor.blue)
        theBeeWatcher = BeeWatcher(bee: theBee)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0,execute: {
            theBee.busy = false
        })
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

