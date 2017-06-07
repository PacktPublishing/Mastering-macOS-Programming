//
//  DataManager.swift
//  5623_07_code
//
//  Created by Stuart Grimshaw on 26/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class DataManager
{
  static let sharedInstance = DataManager()
  
  private init() {}
  
  private func getData() -> Data?
  {
    if let path = Bundle.main.path(forResource: "Bees",
                                   ofType: "plist")
    {
      return FileManager.default.contents(atPath: path)
    }
    return nil
  }
  
  private func serialize(data: Data) -> [[String: Any]]
  {
    var format:PropertyListSerialization.PropertyListFormat = .xml
    
    do
    {
      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: .mutableContainersAndLeaves,
        format: &format)
      
      let plistDictionary = plistData as! [String: Any]
      
      let beeDataArray
        = plistDictionary["BeesData"] as! [[String: Any]]
      
      return beeDataArray
    }
    catch
    {
      print(error)
      return []
    }
  }
  
  private func beesFrom(dictionary: [[String: Any]]) -> [Bee]
  {
    var beesArray = [Bee]()
    
    for bee in dictionary
    {
      if
        let name = bee["name"] as? String,
        let busy = bee["busy"] as? Bool,
        let shoeColor = bee["shoeColor"] as? String,
        let color = colors[shoeColor]
      {
        let nubee = Bee(name: name,
                        busy: busy,
                        shoeColor: color)
        
        beesArray.append(nubee)
      }
    }
    return beesArray
  }
  
  func getBees() -> [Bee]
  {
    guard let data = getData() else { return [] }
    let xmlData = serialize(data: data)
    let beesData = beesFrom(dictionary: xmlData)
    return beesData
  }
  
}
