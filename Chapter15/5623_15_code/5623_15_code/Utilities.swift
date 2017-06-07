//
//  Utilities.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 23/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

func simpleRequest(urlString: String,
                   dataHandler:
  @escaping (Data?, URLResponse?, Error?) -> Void)
{
  let url = URL(string: urlString)!
  let session = URLSession.shared
  let task = session.dataTask(with: url,
                              completionHandler: dataHandler)
  task.resume()
}

func parseJSONData(data: Data) -> [String: AnyObject]?
{
  do {
    
    let json = try JSONSerialization.jsonObject(
      with: data,
      options: .allowFragments) as? [String: AnyObject]
    
    return json
    
  } catch {
    
    print(#function, error)
  }
  return nil
}
