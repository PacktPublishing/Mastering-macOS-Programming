//
//  BeesArrayWrapper.swift
//  5623_07_code
//
//  Created by Stuart Grimshaw on 25/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class BeesArrayWrapper: NSObject
{
  dynamic var content: [Bee]
  
  init(content: [Bee])
  {
    self.content = content
  }
  
  var beeCount: Int { return content.count } // we might change internals
  
  func addBee(bee: Bee)
  {
    content.append(bee)
  }
}
