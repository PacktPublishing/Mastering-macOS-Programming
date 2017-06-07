//
//  DataManager.swift
//  5623_15_code
//
//  Created by Stuart Grimshaw on 23/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

let baseURL = "http://grimshaw.de/macOS-book/api/"
let datamapPath = "datamap.json"

var authorsArray = [String]()

func getAuthors()
{
  let dataMapUrlString = baseURL + datamapPath
  
  simpleRequest(urlString: dataMapUrlString,
                dataHandler: {data, response, error in
                  if let data = data {
                    parseDataMap(data: data)
                  }
  })
}

func parseDataFile(data: Data)
{
  if
    let jsonDict = parseJSONData(data: data),
    let fileMetadata
    = jsonDict["fileMetadata"] as? [String: String],
    let author = fileMetadata["author"]
  {
    print(author)
    authorsArray.append(author)
  }
}

//MARK:- 1st attempt from text: won't work as required
/*
func parseDataMap(data: Data)
{
  if
    let jsonDict = parseJSONData(data: data),
    let paths = jsonDict["paths"] as? [String]
  {
    let opsQueue = OperationQueue()
    let processAuthorsArray = BlockOperation(
      block: {
        print("authorsArray", authorsArray)
      }
    )
    
    for path in paths
    {
      let op = BlockOperation(
        block:{
          simpleRequest(urlString: baseURL + path,
                        dataHandler: {data, response, error in
                          if
                            let data = data
                          {
                            parseDataFile(data: data)
                          }
          })
      })
      
      
      processAuthorsArray.addDependency(op)
      opsQueue.addOperation(op)
    }
    opsQueue.addOperation(processAuthorsArray)
  }
}
*/

//MARK:- Using SynchronousDataLoadOperation
func parseDataMap(data: Data)
{
  if
    let jsonDict = parseJSONData(data: data),
    let paths = jsonDict["paths"] as? [String]
  {
    let opsQueue = OperationQueue()
    let processAuthorsArray = BlockOperation(
      block: { print(authorsArray)} )
    
    for path in paths
    {
      let op = SynchronousDataLoadOperation(
        urlString: baseURL + path,
        onLoaded: parseDataFile)
      
      processAuthorsArray.addDependency(op)
      opsQueue.addOperation(op)
    }
    opsQueue.addOperation(processAuthorsArray)
  }
}

//MARK:- Using JSONDataLoadOperation
/*
func parseDataMap(data: Data)
{
  if
    let jsonDict = parseJSONData(data: data),
    let paths = jsonDict["paths"] as? [String]
  {
    let opsQueue = OperationQueue()
    let processAuthorsArray = BlockOperation(
      block: { print(authorsArray)} )
    
    for path in paths
    {
      let op = JSONDataLoadOperation(
        urlString: baseURL + path,
        onLoaded: parseDataFile)
      
      processAuthorsArray.addDependency(op)
      opsQueue.addOperation(op)
    }
    opsQueue.addOperation(processAuthorsArray)
  }
}
*/






