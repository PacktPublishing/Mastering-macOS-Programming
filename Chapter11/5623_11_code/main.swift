//
//  main.swift
//  5623_11_code
//
//  Created by Stuart Grimshaw on 16/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//


import Foundation

enum MathError: Error
{
  case divideByZeroError
  case negativeNumberError
  case lousyNumberError(objection: String)
}

func divide(_ a: Double,
            by b: Double) throws -> Double
{
  guard b != 0 else { throw MathError.divideByZeroError }
  if b == 0.0
  {
    throw MathError.divideByZeroError
  }
  return a / b
}

func crashOnError() -> Double
{
  return try! divide(1, by: 0.0)
}
//crashOnError()

func returnOptional() -> Double?
{
  return  try? divide(1, by: 0.0)
}
print("returnOptional:", returnOptional())

//MARK:- do-catch
func useDoCatch() -> Double?
{
  do {
    return  try divide(1, by: 0.0)
  } catch {
    print(#function, error)
  }
  return nil
}
print("useDoCatch:", useDoCatch())

func patternMatchedDoCatch() -> Double?
{
  do {
    return  try divide(1, by: 0.0)
  } catch MathError.divideByZeroError {
    print (#function, "oh oh, divide by zero")
  } catch {
    print(#function, error)
  }
  return nil
}
print("patternMatchedDoCatch:", patternMatchedDoCatch())

func doCatchWhere()
{
  do {
    
    throw MathError.lousyNumberError(objection: "I don't do primes")
    
  }
  catch MathError.lousyNumberError (let error)
    where error == "I don't do primes" {
      
      print("You were told not to attempt a prime")
      
  }
  catch MathError.lousyNumberError {
    
    print("Some other objection")
    
  }
  catch {
    
    print(error)
    
  }
}
print("doCatchWhere:", doCatchWhere())

//MARK:- propagation
func innerFunc() throws
{
  throw MathError.negativeNumberError
}

func outerFunc() throws
{
  try innerFunc()
}

func consumerFunc()
{
  do {
    try outerFunc()
  }
  catch {
    print(error)
  }
}

func innermost(_ a: Double,
               by b: Double)
  throws -> Double?
{
  if a < 0.0
  {
    throw MathError.negativeNumberError
  }
  if b == 0.0
  {
    throw MathError.divideByZeroError
  }
  return a / b
  
}

func middle(_ a:Double,
            by b: Double)
  throws -> Double?
{
  let result = try innermost(a, by: b)
  return result
}

func outermost()
{
  for (dividend, divisor) in [(1.0, 0.0),
                              (-1.0, 0.0),
                              (1.0, 1.0)]
  {
    do {
      let d = try middle(dividend, by: divisor)
      print(d)
    }
    catch {
      print(error)
    }
  }
}
outermost()

//MARK:- propagating case study 2
struct Pupil
{
  let name: String
  func attemptExam() throws
  {
    let x = try divide(1.0, by: 0.0)
    print("Homework answer = \(x)")
  }
}

let pupils = [Pupil(name: "Dennis"),
              Pupil(name: "Gnasher")]

struct Teacher
{
  func assignExam() throws
  {
    for pupil in pupils
    {
      print("Attempt by \(pupil.name)")
      //      do {
      try pupil.attemptExam()
      //      } catch {
      //        print("Exam error found by \(student.name)")
      //      }
    }
  }
  
  func handleNewExam() throws
  {
    try assignExam()
  }
  
}

func testNewExam()
{
  let oldAndGrumpy = Teacher()
  do {
    try oldAndGrumpy.handleNewExam()
  } catch {
    print("Bad curriculum: \(error)")
  }
}

testNewExam()

//MARK:- Verbose errors
enum DevelopmentError: Error
{
  enum DevelopmentErrorDomain
  {
    case specsErrorDomain
    case managementErrorDomain
    case highlyImplausibleDeveloperErrorDomain
    
  }
  
  case undefined
  case networkError(errorCode: Int)
  case verboseError(userInfo: [String: Any])
  case seriouslyVerboseError(
    date: Date,
    domain: DevelopmentErrorDomain,
    userInfo: [String: Any],
    payload: Any)
  
  var errorTypeString: String {
    return "DevelopmentError"
  }
  
}

func testErrors(verbose: Bool)
{
  do {
    let problematicData = [2, 3, 5, 6, 7]
    // find issue with problematicData
    let info: [String: Any] = ["reason": "found non-prime"]
    
    if verbose
    {
      throw DevelopmentError.seriouslyVerboseError(
        date: Date(),
        domain: .specsErrorDomain,
        userInfo: info,
        payload: problematicData)
    }
    else
    {
      throw DevelopmentError.undefined
    }
  } catch let error as DevelopmentError {
    
    // do something special
    print(error.errorTypeString, error)
    
  } catch {
    
    // all other errors
    print(error)
  }
}
testErrors(verbose: false)
testErrors(verbose: true) // almost as bad NSLog!


//MARK:- Anything can be an error //
struct Person: Error
{
  let name:String
  let address: String?
  let age: Int
}

func grantCredit(to candidate: Person) throws -> Int
{
  if candidate.address == nil
  {
    throw candidate
  }
  
  return candidate.age > 21 ? 10_000 : 100
}

func processRequest(customer: Person) -> Int?
{
  do {
    let availableCredit = try grantCredit(to: customer)
    return availableCredit
  } catch let failedCandidate as Person {
    print("Request error:",
          failedCandidate.name,
          "needs a valid address")
  } catch {
    print(error)
  }
  return nil
}
let customer = Person(name: "Zaphod", address: nil, age: 42)
let availableCredit = processRequest(customer: customer)
print("Available credit:", availableCredit)


//MARK:-Dealing with Cocoa's NSError types'

let url1 = URL(fileURLWithPath: "/non-existent")
let url2 = URL(fileURLWithPath: "/someLocation")
do {
  try FileManager.default.moveItem(at: url1, to: url2)
} catch let error as NSError {
  print(error)
}

//MARK:- pattern-matched Coco catch blocks
do {
  try FileManager.default.moveItem(at: url1, to: url2)
} catch {
  print("bugger", error)
}

func divide(a: Double, b: Double) throws -> Double
{
  if b == 0.0
  {
    throw NSError(domain: "CustomErrorDomainString",
                  code: 5001,
                  userInfo: ["ErrorType": "DivideByZeroError"])
  }
  return a / b
}
do {
  let x = try divide(a: 1, b: 0)
} catch let error {
  print(error)
}
