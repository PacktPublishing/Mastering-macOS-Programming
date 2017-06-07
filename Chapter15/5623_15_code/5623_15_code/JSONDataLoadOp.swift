//
//  JSONDataLoadOp.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 26/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class JSONDataLoadOperation: ConcurrentOperation
{
  private var urlString: String
  var onLoaded: (Data) -> ()
  
  init(urlString: String,
       onLoaded:@escaping (Data) -> ())
  {
    self.urlString = urlString
    self.onLoaded = onLoaded
    super.init()
  }
  
  override func main()
  {
    simpleRequest(urlString: urlString,
                  dataHandler: {
                    data, response, error in
                    
                    if let data = data
                    {
                      self.onLoaded(data)
                      self.state = .Finished
                    }
                    // else handle error
    })
  }
}
