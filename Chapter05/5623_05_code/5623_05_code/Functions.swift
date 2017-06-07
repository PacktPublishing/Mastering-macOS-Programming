//
//  Functions.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 10/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

func triple(_ a: Int) -> Int
{
  return a * 3
}
func triple(_ a: Double) -> Double
{
  return a * 3.0
}
func triple(_ a: String) -> String
{
  return "\(a)\(a)\(a)"
}

func appraise(int: Int,
              f: (Int) -> Void)
{
  f(int)
}

func isBinary(i: Int)
{
  switch i
  {
  case 0: print("zero")
  case 1: print("one")
  default: print("not binary")
  }
}

func introduceNumbers(string: String, numbers: Int...)
{
  for number in numbers
  {
    print(string, number)
  }
}

func testFunctions()
{
  introduceNumbers(string: "This is a", numbers: 1,2,3)
  
  appraise(int: 3, f: isBinary)
}

typealias SingleIntegerOperation = (Int) -> Int


func performMathOperation(int: Int, f: SingleIntegerOperation)
{
  f(int)
}


func paintFace(color: String = "white")
{
  print("I have painted my face \(color)")
}
func paintWagon(color: String? = nil)
{
  if let color = color {
    print("I have painted the wagon \(color)")
  }
}

func testIt()
{
  print(triple(3))
  print(triple(3.0))
  print(triple("3"))
  
  paintFace()
  paintFace(color: "red")
  
  paintWagon()
  paintWagon(color: "yellow")
}


