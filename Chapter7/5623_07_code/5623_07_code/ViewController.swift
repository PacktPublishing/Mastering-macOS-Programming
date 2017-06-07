//
//  ViewController.swift
//  5623_07_code
//
//  Created by Stuart Grimshaw on 25/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
  var tableView: NSTableView!
  var infoLabel:NSTextField!
  var beesArrayWrapper = BeesArrayWrapper(content: [])
  
  let kContentKeyPath = "content"
  private var myContext = 0
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    beesArrayWrapper.addObserver(self,
                                 forKeyPath: kContentKeyPath,
                                 options: [.new, .old],
                                 context: &myContext)
    
    buildUI()
    
    beesArrayWrapper.content = DataManager.sharedInstance.getBees()
    
    queueUpChanges()
  }
  
  func buildUI()
  {
    func addTable()
    {
      let tableRect = CGRect(
        x: 20,
        y: 115,
        width: 240,
        height: 135)
      
      let tableScrollView = NSScrollView(frame: tableRect)
      self.tableView = NSTableView(frame: tableRect)
      
      tableView.dataSource = self
      tableView.delegate = self
      
      tableScrollView.documentView = tableView
      view.addSubview(tableScrollView)
    }
    
    func configureTable()
    {
      let nameColumn = NSTableColumn(identifier: "nameColumn")
      nameColumn.title = "Name"
      nameColumn.minWidth = 100
      tableView.addTableColumn(nameColumn)
      
      let statusColumn = NSTableColumn(identifier: "statusColumn")
      statusColumn.title = "Status"
      statusColumn.minWidth = 130
      tableView.addTableColumn(statusColumn)
      
      //      tableView.intercellSpacing = CGSize(width: 5.0, height: 5.0)
            tableView.usesAlternatingRowBackgroundColors = true
    }
    
    func addInfoLabel()
    {
      let infoLabelFrame = NSRect(
        x: 268,
        y: 228,
        width: 192,
        height: 22)
      
      self.infoLabel = NSTextField(frame: infoLabelFrame)
      view.addSubview(infoLabel)
    }
    
    func addSortButton()
    {
      let frame = CGRect(x: 268,
                         y: 178,
                         width: 192,
                         height: 32)
      
      let sortButton = NSButton(frame: frame)
      
      sortButton.bezelStyle = .rounded
      sortButton.title = "Sort"
      
      sortButton.target = self
      sortButton.action = #selector(ViewController.sortButtonClicked)
      
      view.addSubview(sortButton)
    }
    
    addTable()
    configureTable()
    addInfoLabel()
    
    addSortButton()
    
  }
  
  func sortButtonClicked()
  {
    let sortedArray = beesArrayWrapper.content.sorted(by: { $0.name < $1.name })
    beesArrayWrapper.content = sortedArray
  }
  
  //MARK:- KVO
  override func observeValue(forKeyPath keyPath: String?,
                             of object: Any?,
                             change: [NSKeyValueChangeKey : Any]?,
                             context: UnsafeMutableRawPointer?)
  {
    if context == &myContext
    {
      tableView.reloadData()
    }
    else
    {
      super.observeValue(forKeyPath: keyPath,
                         of: object,
                         change: change,
                         context: context)
    }
  }
  
  deinit
  {
    removeObserver(self, forKeyPath: kContentKeyPath)
  }
  
  func queueUpChanges()
  {
    DispatchQueue.main.asyncAfter(
      deadline: .now() + 2.0,execute: {
        self.beesArrayWrapper.content[0].name = "Bing"
        self.beesArrayWrapper.addBee(bee: Bee(
          name: "Elvis",
          busy: true,
          shoeColor: .blue))
    })
  }
  
}

extension ViewController: NSTableViewDataSource
{
  func numberOfRows(in tableView: NSTableView) -> Int
  {
    return self.beesArrayWrapper.beeCount
  }
}

extension ViewController: NSTableViewDelegate
{
  
  func tableView(_ tableView: NSTableView,
                 viewFor tableColumn: NSTableColumn?,
                 row: Int) -> NSView?
  {
    if tableColumn == tableView.tableColumns[0]
    {
      let cellIdentifier = "NameCellID"
      var cell = tableView.make(withIdentifier: cellIdentifier,
                                owner: self) as? NSTextField
      
      if cell == nil
      {
        cell = NSTextField(frame: NSRect(
          x: 0,
          y: 0,
          width: tableView.frame.size.width,
          height: 0))
      }
      
      if let cell = cell
      {
        cell.identifier = cellIdentifier
        
        cell.stringValue = beesArrayWrapper.content[row].name
        cell.textColor = beesArrayWrapper.content[row].shoeColor
        cell.backgroundColor = .clear
        
        cell.isBezeled = false
        cell.isEditable = false
      }
      return cell
    }
    else if tableColumn == tableView.tableColumns[1]
    {
      let cellIdentifier = "StatusCellID"
      var cell = tableView.make(withIdentifier: cellIdentifier,
                                owner: self) as? NSTextField
      
      if cell == nil
      {
        cell = NSTextField(frame: NSRect(
          x: 0,
          y: 0,
          width: tableView.frame.size.width,
          height: 0))
      }
      
      if let cell = cell
      {
        cell.identifier = cellIdentifier
        
        cell.stringValue = beesArrayWrapper.content[row].busy ? "Busy" : "Not busy"
        cell.backgroundColor = .clear
        
        cell.isBezeled = false
        cell.isEditable = false
      }
      return cell
    }
    return nil
  }
  
  func tableView(_ tableView: NSTableView,
                 heightOfRow row: Int) -> CGFloat
  {
    return 22.0
  }
  
  func tableViewSelectionDidChange(_ notification: Notification)
  {
    let theTableView = notification.object as! NSTableView
    
    let indexes = theTableView.selectedRowIndexes
    if let index = indexes.first
    {
      self.infoLabel.stringValue = 										beesArrayWrapper.content[index].name
    }
  }
  
  
}
