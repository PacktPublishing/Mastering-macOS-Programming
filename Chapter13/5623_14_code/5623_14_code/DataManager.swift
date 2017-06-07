//
//  DataManager.swift
//  5623_14_code
//
//  Created by Stuart Grimshaw on 5/12/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation
import CoreData

class DataManager
{
  let managedObjectContext: NSManagedObjectContext
  
  init(managedObjectContext: NSManagedObjectContext)
  {
    self.managedObjectContext = managedObjectContext
    
    makeCrew()
    doFetchCrew()
//    sortedFetchCrew()
//    predicateFetchCrew()
//    deleteDoomedSecurityGuy()
//    sortedFetchCrew()
  }
  
  
  func makeCrew()
  {
    let personEntityDescription
      = NSEntityDescription.entity(forEntityName: "Person",
                                   in: managedObjectContext)
    
    let captain
      = NSManagedObject(entity: personEntityDescription!,
                        insertInto: managedObjectContext)
    captain.setValue("Kirk",
                     forKey: #keyPath(Person.name))
//    captain.setValue("Kirk", forKey: "name") // not checked at compile time
    captain.setValue(1,
                     forKey: #keyPath(Person.rank))
    captain.setValue("Yellow",
                     forKey: #keyPath(Person.shirtColor))
    
    let cso
      = NSManagedObject(entity: personEntityDescription!,
                        insertInto: managedObjectContext)
    cso.setValue("Spock",
                  forKey: #keyPath(Person.name))
    cso.setValue(2,
                  forKey: #keyPath(Person.rank))
    cso.setValue("Blue",
                  forKey: #keyPath(Person.shirtColor))
    cso.setValue(captain,
                  forKey: #keyPath(Person.superior))
    
    let uhura
      = NSManagedObject(entity: personEntityDescription!,
                        insertInto: managedObjectContext)
    uhura.setValue("Uhura",
                   forKey: #keyPath(Person.name))
    uhura.setValue(3,
                   forKey: #keyPath(Person.rank))
    uhura.setValue("Red",
                   forKey: #keyPath(Person.shirtColor))
    
    let kirkSubordinates = captain.mutableSetValue(
      forKey: #keyPath(Person.subordinates))
    
    kirkSubordinates.add(uhura)
    
    let sulu = NSManagedObject(
      entity: personEntityDescription!,
      insertInto: managedObjectContext)
    sulu.setValue("Sulu",
                  forKey: #keyPath(Person.name))
    sulu.setValue(3,
                  forKey: #keyPath(Person.rank))
    sulu.setValue("Yellow",
                  forKey: #keyPath(Person.shirtColor))
    
    let doomedSecurityGuy = NSManagedObject(
      entity: personEntityDescription!,
      insertInto: managedObjectContext)
    doomedSecurityGuy.setValue("Nameless",
                               forKey: #keyPath(Person.name))
    doomedSecurityGuy.setValue(4,
                               forKey: #keyPath(Person.rank))
    doomedSecurityGuy.setValue("Red",
                               forKey: #keyPath(Person.shirtColor))
    
    kirkSubordinates.addObjects(from: [sulu, doomedSecurityGuy])
  
  }
  
  func doFetchCrew()
  {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    
    do {
      let result = try managedObjectContext.fetch(fetchRequest)
      
      for person in result
      {
        let person = person as! NSManagedObject
        if let name = person.value(forKey: #keyPath(Person.name))
        {
          print("NAME = \(name)")}
        print(person)
      }
    } catch {
      print(error)
    }
  }

  func sortedFetchCrew()
  {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
      entityName: "Person")
    
    let rankSortDescriptor = NSSortDescriptor(key: "rank",
                                              ascending: true)
    
    let nameSortDescriptor = NSSortDescriptor(key: "name",
                                              ascending: true)
    
    fetchRequest.sortDescriptors = [rankSortDescriptor,
                                    nameSortDescriptor]
    
    do {
      let result
        = try managedObjectContext.fetch(fetchRequest)
      
      for managedObject in result
      {
        let object = managedObject as! NSManagedObject
        
        if let rank = object.value(forKey: "rank"),
          let name = object.value(forKey: "name")
        {
          print("rank: \(rank): name = \(name)")
        }
      }
    }
    catch {
      let err = error as NSError
      print(err)
    }
  }
  
  func predicateFetchCrew()
  {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
      entityName: "Person")
    let nameSortDescriptor = NSSortDescriptor(
      key: "name", ascending: true)
    fetchRequest.sortDescriptors = [nameSortDescriptor]
    
    let predicate = NSPredicate(format: "%K < %i",
                                "rank", 3)
    
    fetchRequest.predicate = predicate
    
    do {
      let result
        = try managedObjectContext.fetch(fetchRequest)
      
      for managedObject in result
      {
        let object = managedObject as! NSManagedObject
        if let rank = object.value(forKey: "rank"),
          let name = object.value(forKey: "name")
        {
          print("rank: \(rank): name = \(name)")
        }
      }
    } catch {
      let err = error as NSError
      print(err)
    }
  }

  func deleteDoomedSecurityGuy()
  {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    fetchRequest.predicate = NSPredicate(format: "%K == %@",
                                         "shirtColor", "Red")
    
    do {
      let landingParty
        = try managedObjectContext.fetch(fetchRequest)
      
      for crewMember in landingParty
      {
        let object = crewMember as! NSManagedObject
        if let color = object.value(forKey: #keyPath(Person.shirtColor)) as? String, color == "Red",
          let name = object.value(forKey: #keyPath(Person.name)) as? String, name != "Uhura"
        {
          print("Zap!")
          self.managedObjectContext.delete(object)
          
          do { try managedObjectContext.save() }
          catch { print(error) }
        }
      }
    }
    catch {
      let err = error as NSError
      print(err)
    }
  }

}
