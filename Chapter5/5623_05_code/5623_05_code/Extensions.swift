//
//  Extensions.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 6/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

extension Int
{
  mutating func incrementInPlace()
  {
    self += 1
  }
}

extension Int
{
  func incremented() -> Int
  {
    return self + 1
  }
}

/*func testExtensions()
{
  var i = 1
  i.incrementInPlace()
  print(i)
  
  // mutating, so let won't do it
  
  let j = 1
  let k = j.incremented()
  print(j, k)
}*/

extension CGRect
{
  var area: CGFloat {
    return self.width * self.height
  }
  
  func declareWhetherSquare()
  {
    if self.width == self.height
    {
      print("I am square")
    }
    else
    {
      print("I am not square")
    }
  }
}

func testExtensions()
{
let frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
print(frame.area)
frame.declareWhetherSquare()
}
