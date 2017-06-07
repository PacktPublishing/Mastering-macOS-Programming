

import Cocoa

class ViewController: NSViewController
{
    @IBOutlet weak var rateTextField: NSTextField!
    @IBOutlet weak var preTaxTextField: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        #if DEV
            rateTextField.stringValue = "16"
            preTaxTextField.stringValue = "144"
        #else
            // possibly something else
        #endif
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func rateDidChange(_ sender: AnyObject)
    {
        calculateFullPrice()
    }
    
    @IBAction func preTaxDidChange(_ sender: AnyObject)
    {
        calculateFullPrice()
    }

    func calculateFullPrice()
    {
        var currencyString = "$"
        
        let envVars = ProcessInfo.processInfo.environment
        if let envVar = envVars["Currency Symbol"]
        {
            currencyString = envVar
            print("Currency Symbol = \(envVar)")
        }
        
        let rate = rateTextField.doubleValue / 100.0 + 1.0
        let fullPrice = preTaxTextField.doubleValue * rate
        resultLabel.stringValue = currencyString
            + String(format: "%.2f", fullPrice)
    }
}

