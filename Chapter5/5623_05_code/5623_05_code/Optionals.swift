//
//  Optionals.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 7/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation


func testOptionals()
{
if let id = Int("12364677")
{
  print("Valid id: \(id)")
}

let jsonResponse: [String: Any] = ["user": "Elliot",
                                   "id": "Elliot1983"]

if let userString = jsonResponse["user"] as? String
{
  print("User string contains \(userString.characters.count) characters")
}

if let id = jsonResponse["id"] as? Int
{
  print("Valid id: \(id)")
}
else
{
  print("Invalid id")
}

guard let id = Int("42") else { return }
let myID: Int = id
print(myID)
  
printId(int: Int("34a"))
  
var a:Int!
a = 3
let b: Int = a
let c: Int = a * 2
print(b, c)

}

func printId(int: Int?)
{
  guard let int = int else {
    print(#function, "failed")
    return }
  print(int)
}
