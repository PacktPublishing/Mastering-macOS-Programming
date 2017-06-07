//
//  SyncCustomOp.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 26/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class SynchronousDataLoadOperation: Operation
{
  let urlString: String
  let onLoaded: (Data) -> ()
  
  init(urlString: String,
       onLoaded:@escaping (Data) -> ())
  {
    self.urlString = urlString
    self.onLoaded = onLoaded
    super.init()
  }
  
  override func main()
  {
    var isDone = false
    
    simpleRequest(urlString: urlString,
                  dataHandler: {
                    data, response, error in
                    
                    if let data = data
                    {
                      self.onLoaded(data)
                      isDone = true
                    }
                    // else handle error
    })
    while isDone == false{}
  }
}
