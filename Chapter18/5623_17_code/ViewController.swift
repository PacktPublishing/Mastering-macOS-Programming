

import Cocoa

enum myError: Error{
  case general
}

class ViewController: NSViewController
{
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    let report = Report()
    report.title = "Weekly Summary"
    report.date = Date()
    report.approved = true
    print()
    
    testBreakpoints()
    testStepCommands()
    testWatchpoints()
  }
  
  func testBreakpoints()
  {
    // Log Message
    var total = 0
    for _ in 0..<5
    {
      total += 1
    }
    
    // Debugger Command
    let s = "Doug"
    let i = 42
    let b = true
    
    var option = "Debugger Command"
    
    // Shell Command
    option = "Shell Command"
    
    // AppleScript
    option = "AppleScript alert"
    option = "AppleScript mail"
  }
  
  func testStepCommands()
  {
    func printObservation()
    {
      print("Today you are you!")
      print("That is truer than true!")
      print("There is no one alive who is you-er than you!")
    }
    
    func printPrediction()
    {
      print("And will you succeed?")
      print("Yes you will indeed!")
      print("98 and 3/4 percent guaranteed.")
    }
    
    printObservation()
    printPrediction()
    
  }
  
  func testWatchpoints()
  {
    var x = 0
    // set watchpoint here
    print("Hold it there a moment")
    x = 1
    x = 2
  }
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

