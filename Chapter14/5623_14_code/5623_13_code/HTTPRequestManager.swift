//
//  HTTPRequestManager.swift
//  5623_13_code
//
//  Created by Stuart Grimshaw on 14/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class HTTPRequestManager
{
  static let sharedInstance = HTTPRequestManager()
  let session: URLSession
  let sessionDelegate: HTTPRequestDelegate
  
  private  init()
  {
    let configuration = URLSessionConfiguration.background(withIdentifier: "downloadConfig")
    configuration.httpAdditionalHeaders
      = ["Accept": "application/pdf"]
    sessionDelegate = HTTPRequestDelegate()
    session = URLSession(configuration: configuration,
                         delegate: sessionDelegate,
                         delegateQueue: nil)
  }
  
  func downloadRequest(urlString: String)
  {
    let url = URL(string: urlString)!
    let task = session.downloadTask(with: url)
    task.taskDescription = "download pdf"
    task.resume()
    sessionDelegate.downLoadTasks.append(task)
  }
  
func cacheDataRequest()
{
  let url = URL(string: "http://www.grimshaw.de/macOS-book/test.json")!
  let request = URLRequest(url: url,
                           cachePolicy: .returnCacheDataElseLoad,
                           timeoutInterval: 20)
  let session = URLSession.shared
  let task = session.dataTask(with: request,
                              completionHandler:
    {
      data, response, error in
      do {
        let jsonData = try JSONSerialization.jsonObject(with: data!,
                                                        options: [.allowFragments])
        print(jsonData)
      }
      catch let error {
        HTTPError.downloadError(source: #function, error: error)
      }
  })
  task.resume()
}
  
  func cancelDownloads()
  {
    print(#function)
    for task in sessionDelegate.downLoadTasks
    {
      task.cancel()
    }
  }
  
  func suspendDownloads()
  {
    print(#function)
    for task in sessionDelegate.downLoadTasks
    {
      task.suspend()
    }
  }
  
  func resumeDownloads()
  {
    print(#function)
    for task in sessionDelegate.downLoadTasks
    {
      task.resume()
    }
  }
  
}
