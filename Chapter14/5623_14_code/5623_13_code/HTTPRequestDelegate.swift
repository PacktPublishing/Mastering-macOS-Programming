//
//  HTTPRequestDelegate.swift
//  5623_13_code
//
//  Created by Stuart Grimshaw on 14/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

public class HTTPRequestDelegate: NSObject,
  URLSessionDelegate,
  URLSessionTaskDelegate,
  URLSessionDownloadDelegate
{
  var downLoadTasks: [URLSessionDownloadTask] = []
  
  
  //MARK:- URLSessionDownloadTaskDelegate
  public func urlSession(_ session: URLSession,
                         downloadTask: URLSessionDownloadTask,
                         didFinishDownloadingTo location: URL)
  {
    print(#function, downloadTask.taskIdentifier)
    
    let fileManager = FileManager.default
    let documentUrls = fileManager.urls(for: .documentDirectory,
                                        in: .userDomainMask)
    
    guard let firstURL = documentUrls.first  else {return}
    
    let ourDocsFolderPath = firstURL.appendingPathComponent("OurFolder")
    do {
      try FileManager.default.createDirectory(
        at: ourDocsFolderPath as URL,
        withIntermediateDirectories: true,
        attributes: nil)
    }
    catch let error {
      HTTPError.downloadError(source: #function, error: error)
    }
    
    let fileName
      = downloadTask.response?.suggestedFilename ?? "untitled.pdf"
    let diskLocation = ourDocsFolderPath.appendingPathComponent(fileName)
    
    do {
      try FileManager.default.moveItem(at: location,
                                       to: diskLocation)
    }
    catch let error {
      HTTPError.downloadError(source: #function, error: error)
    }
    
    print(downLoadTasks)
  }
  
  public func urlSession(_ session: URLSession,
                         downloadTask: URLSessionDownloadTask,
                         didWriteData bytesWritten: Int64,
                         totalBytesWritten: Int64,
                         totalBytesExpectedToWrite: Int64)
  {
    print(totalBytesWritten, "of", totalBytesExpectedToWrite)
  }
  
  //MARK:- URLSessionTaskDelegate
  public func urlSession(_ session: URLSession,
                         task: URLSessionTask,
                         didCompleteWithError error: Error?)
  {
    print(#function)
    
    for (index, storedTask) in downLoadTasks.enumerated()
    {
      if storedTask == task
      {
        downLoadTasks.remove(at: index)
        print("removed ", task.taskIdentifier)
      }
    }
    HTTPError.downloadError(source: #function, error: error)
  }
}
