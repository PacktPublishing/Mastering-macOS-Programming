//
//  Enums.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 6/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

enum Response
{
  case string(String)
  case array([String])
}

let response = Response.string("hi there")

func handleResponse(response: Response)
{
  switch response
  {
  case .string(let s):
    // do one thing
    print(s)
  case .array(let a):
    print(a)
    
  }
}

enum Coordinate
{
  case cartesian(x: Double, y: Double)
  case polar(r: Double, theta: Double)
}
/*func testEnums()
{
  let myCartesianPosition = Coordinate.cartesian(x: 100.0, y: 100.0)
  let myPolarPosition = Coordinate.polar(r: 50.0, theta: 0.5)

  var myCoordinates: [Coordinate] = []
  myCoordinates.append(myCartesianPosition)
  myCoordinates.append(myPolarPosition)
  // yay mixed types in a Swift array

  for coordinate in myCoordinates
  {
    switch coordinate
    {
    case .cartesian(let c):
      print("Cartesian coordinate: x = \(c.x), y = \(c.y)")
    case .polar(let p):
      print("Polar coordinate: r = \(p.r), theta = \(p.theta)")
    }
  }
}
*/

// recursive definitions
typealias Book = String
// won't compile
//enum Box
//{
//  case books([Book])
//  case boxes(Box)
//}

enum Box
{
  case books([Book])
  indirect case box(Box)
}

/*func testEnums()
{
  let redBox = Box.books(["Fox Socks Box Knox...",
                          "The sun did not shine..."])
  let woodenBox = Box.box(redBox)
  print(woodenBox)
  
  let smallRedBox = Box.books(["One fish. Two fish..."])
  let smallWoodenBox = Box.box(smallRedBox)
  print(smallWoodenBox)
}
*/

enum TrafficLightColor
{
  case red, amber, green
  
  func blah(s: String)
  {
    print(s)
  }
  
  func inFrench() -> String
  {
    switch self
    {
    case .red:
      return "Rouge"
    case .amber:
      return "Jaune"
    case .green:
      return "Vert"
    }
  }
}


func testEnums()
{
  let stop: TrafficLightColor = .red
  print(stop.inFrench())  
}

enum APIKey: String
{
  case userName, password, email
}
/*func testEnums()
{
// data layer
typealias APIParams = [APIKey: String]
// can't mess up the key now
let userCredentials: APIParams = [.userName: "Ali Baba",
                                  .password: "Open Sesame",
                                  .email: "notinvented@themoment"]
print(userCredentials)

//in service layer
var httpParameters: [String: String] = [:]
for apiKey in userCredentials.keys
{
  httpParameters[apiKey.rawValue] = userCredentials[apiKey]
}
print(httpParameters)
}*/
