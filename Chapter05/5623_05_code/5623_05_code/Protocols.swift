//
//  Protocols.swift
//  ch05skect
//
//  Created by Stuart Grimshaw on 6/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

protocol Talkative
{
  func sayHi()
}

extension Talkative
{
  func sayBye(){
    print("bye!")
  }
}

struct ChattyStruct: Talkative
{
  func sayHi()
  {
    print("hi")
  }
  
//  func sayBye() {
//    print("au revoir")
//  }
  
}

extension Int: Talkative
{
  func sayHi()
  {
    print("Hey, I'm \(self)")
    
    if self%2 != 0
    {
      print("Isn't that odd?")
    }
  }
}

func testProtocols()
{
  let anon = ChattyStruct()
  anon.sayHi()
  anon.sayBye()
  
  1.sayHi()
  
  var talkativesArray: [Talkative] = []
  talkativesArray.append(anon)
  talkativesArray.append(42)
  
  for entity in talkativesArray
  {
    entity.sayHi()
    if let entity = entity as? Int
    {
      print("... and twice \(entity) makes \(entity * 2)")
    }
  }
  
}

protocol TalkativePerson: Talkative
{
  var name: String { get }
  var address: String { get set}
}

struct MarketingGuy: TalkativePerson
{
  let name: String
  var address: String

  func sayHi() {
    print("Yes, I'm \(name), here's my card. Say, may I blah blah blah...")
  }
}

/*func testProtocols()
{
  var chattyGuy = MarketingGuy(name: "Ivor Lottosay",
                               address: "Room 214")
  chattyGuy.sayHi()
  chattyGuy.address = "Room 216"
}*/

// class protocol
protocol ClassyProtocol: class
{
  func addClassToClassesList()
}
class MyClass: NSObject, ClassyProtocol
{
  func addClassToClassesList() {
    // ...
  }
}

// protocol composition
protocol Pensive
{
  func reactToStimulus()
}

struct Philosopher: Talkative, Pensive
{
  func sayHi()
  {
    print("hi")
  }
  func reactToStimulus()
  {
    print("I thing therefore I am")
  }
}

