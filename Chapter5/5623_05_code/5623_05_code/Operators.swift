//
//  Operators.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 6/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

struct GridMovement
{
  let rows: Int
  let cols: Int
}

extension GridMovement
{
  static func + (lhs: GridMovement,
                 rhs: GridMovement) -> GridMovement
  {
    let rows = lhs.rows + rhs.rows
    let cols = lhs.cols + rhs.cols
    return GridMovement(rows: rows, cols: cols)
  }
  
  static func * (multiplier: Int,
                 movement: GridMovement) -> GridMovement
  {
    let rows = multiplier * movement.rows
    let cols = multiplier * movement.cols
    return GridMovement(rows: rows, cols: cols)
  }
  
  static func * (movement: GridMovement,
                 multiplier: Int) -> GridMovement
  {
    let rows = movement.rows * multiplier
    let cols = movement.cols * multiplier
    return GridMovement(rows: rows, cols: cols)
  }
  
  static func += (lhs: inout GridMovement,
                  rhs: GridMovement)
  {
    lhs = lhs + rhs
  }
}

extension GridMovement
{
  static func == (lhs: GridMovement, rhs: GridMovement) -> Bool
  {
    return lhs.rows == rhs.rows && lhs.cols == rhs.cols
  }
}

prefix operator -><- // must be at file position

extension GridMovement
{
  static prefix func -><- (movement: inout GridMovement)
  {
    movement = GridMovement(rows: movement.cols, cols: movement.rows)
  }
}

func testOperators()
{
var movementA = GridMovement(rows: 3, cols: 5)
movementA = movementA * 2
print(movementA)
var movementB = GridMovement(rows: 11, cols: 13)
let movementC = movementA + movementB
print(movementC)
movementB += movementA
print(movementA == movementB)
print(movementB)
-><-movementB
print(movementB)
  
}

