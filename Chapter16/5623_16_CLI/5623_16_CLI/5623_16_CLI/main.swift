//
//  main.swift
//  5623_16_CLI
//
//  Created by Stuart Grimshaw on 28/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

var varString = "Here we go"

class MyClass
{
  var integerProperty = 777
  
//  override var debugDescription: String {
//    return "This is the class debugDescription"
//  }
  
//  var description: String {
//    return "This is my class, its intProp value is \(integerProperty)"
//  }
  
  func debugQuickLookObject() -> AnyObject
  {
    let info =  "This is my class, its intProp value is \(integerProperty)" as AnyObject
    return info
  }
}

var myClass = MyClass()
print("This is Target Output")

//func googleRequest() -> URLSessionDataTask
//{
//  let mySession = URLSession.shared
//  let request = URL(string: "http://google.com")!
//  let task = mySession.dataTask(with: request,
//                                completionHandler: {data, response, error in
//                                  print(response)
//  })
//  return task
//}
//
//googleRequest().resume()
//
//while true {}

enum MyError: Error {
  case general
}
enum MyOtherError: Error {
  case other
}
func throwAnError() throws -> Bool {
  throw(MyError.general)
}
func throwAnotherError() throws -> Bool {
  throw(MyOtherError.other)
}
let a = try? throwAnError()
let b = try? throwAnotherError()

print("Bye")
