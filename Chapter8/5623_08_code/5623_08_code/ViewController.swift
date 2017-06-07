  //
  //  ViewController.swift
  //  cb8sketch
  //
  //  Created by Stuart Grimshaw on 14/10/16.
  //  Copyright © 2016 Stuart Grimshaw. All rights reserved.
  //
  
  import Cocoa
  import WebKit
  
  class ViewController: NSViewController, NSTextViewDelegate
  {
    @IBOutlet var textView: NSTextView!
    var customTextView: NSTextView!
    var customTextStorage: CustomTextStorage!
    
    override func viewDidLoad()
    {
      super.viewDidLoad()
      addText()
      createTextView()
    }
    
    func createTextView()
    {
      let newTextViewRect = CGRect(x: 0,
                                   y: 0,
                                   width: view.bounds.width,
                                   height: 130)
      
      let container = NSTextContainer()
      container.size = CGSize(width: newTextViewRect.width,
                              height: CGFloat.greatestFiniteMagnitude)
      container.widthTracksTextView = true //not strictly necessary here, but...
      
      let layoutManager = NSLayoutManager()
      layoutManager.addTextContainer(container)
      
      customTextStorage = CustomTextStorage()
      let attrs = [NSForegroundColorAttributeName: NSColor.darkGray]
      let attrString = NSAttributedString(string: "Type some colors here...", attributes: attrs)
      customTextStorage.append(attrString)
      
      customTextStorage.addLayoutManager(layoutManager)
      
      textView = NSTextView(frame: newTextViewRect,
                            textContainer: container)
      textView.delegate = self
      view.addSubview(textView)
      
    }
    
    func printDetails()
    {
      print("\ntextStorage:\n", textView.textStorage,
            "\ntextContainer:\n", textView.textContainer,
            "\nlayoutManager:\n", textView.layoutManager)
    }
    
    
    func addText()
    {
      //font
      textView.string = "Salut!"
      textView.font = NSFont(name: "Impact", size: 22.0)
      
      return
      
      //attributed strings
      let str1 = NSMutableAttributedString(string: "Hello attributions!\n")
      
      let range = NSRange(location: 6,
                          length: 12)
      
      str1.addAttribute(NSForegroundColorAttributeName,
                        value: NSColor.brown,
                        range: range)
      
      let myAttributes: [String: Any] = [
        NSForegroundColorAttributeName: NSColor.darkGray,
        NSBackgroundColorAttributeName: NSColor.init(red: 0.85,
                                                     green: 0.8,
                                                     blue: 0.8,
                                                     alpha: 1.0),
        NSFontAttributeName: NSFont(name: "Courier", size: 18.0)!]
      
      let str2 = NSMutableAttributedString(string: "Great to be here",
                                           attributes: myAttributes)
      str1.append(str2)
      
      
      let linkAttributes = [NSLinkAttributeName: "http://www.grimshaw.de"] //takes link color
      let link = NSMutableAttributedString(string: "\nClick me already",
                                           attributes: linkAttributes)
      str1.append(link)
      
      let emphasisTextAttributes: [String: Any] = [
        NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue,
        NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
        NSForegroundColorAttributeName: NSColor.black,
        NSStrokeWidthAttributeName : 2.0]
      
      str1.addAttributes(emphasisTextAttributes,
                         range: NSRange(location: 29,
                                        length: 2))
      
      //  let myShadow = NSShadow()
      //  myShadow.shadowBlurRadius = 1
      //  myShadow.shadowOffset = CGSize(width: 8, height: -8)
      //  myShadow.shadowColor = NSColor.init(red: 0.9,
      //                                      green: 0.9,
      //                                      blue: 0.9,
      //                                      alpha: 1.0)
      
      //  str1 .addAttribute(NSShadowAttributeName,
      //                     value: myShadow,
      //                     range: NSRange(location: 46,
      //                                    length: 7))
      
      textView.textStorage?.setAttributedString(str1)
      
    }
    
    override var representedObject: Any? {
      didSet {
        // Update the view, if already loaded.
      }
    }
  }
  
  class CustomTextStorage: NSTextStorage
  {
    let textContent = NSMutableAttributedString()
    override var string: String { return textContent.string }
    
    let normalAttributes = [NSForegroundColorAttributeName: NSColor.darkGray]
    let highlights = ["red": NSColor.red,
                      "blue": .blue,
                      "green": .green]
    
    override func attributes(at location: Int,
                             effectiveRange range: NSRangePointer?) -> [String : Any]
    {
      return textContent.attributes(at: location, effectiveRange: range)
    }
    
    override func replaceCharacters(in range: NSRange,
                                    with str: String)
    {
      beginEditing()
      
      textContent.replaceCharacters(in: range,
                                    with:str)
      
      edited([.editedCharacters, .editedAttributes],
             range: range,
             changeInLength: (str as NSString).length - range.length)
      
      endEditing()
    }
    
    override func setAttributes(_ attrs: [String : Any]?,
                                range: NSRange)
    {
      beginEditing()
      
      textContent.setAttributes(attrs,
                                range: range)
      
      edited(.editedAttributes,
             range: range,
             changeInLength: 0)
      endEditing()
    }
    
    func applyStyles(range: NSRange)
    {
      for (string, color) in highlights
      {
        let regexStr = "\\b\(string)\\b"
        
        do {
          let regex = try NSRegularExpression(pattern: regexStr,
                                              options: [])
          
          regex.enumerateMatches(
            in: textContent.string,
            options: [],
            range: range,
            using: {
              match, flags, stop in
              
              guard let match = match else {return}
              
              let matchRange = match.rangeAt(0)
              self.addAttributes([NSForegroundColorAttributeName: color],
                                 range: matchRange)
              
              let maxRange = matchRange.location + matchRange.length
              if maxRange + 1 < self.length
              {
                self.addAttributes(normalAttributes,
                                   range: NSMakeRange(maxRange, 1))
              }
          })
        }
        catch { print(error) }
      }
    }
    
    override func processEditing()
    {
      var range = NSUnionRange(
        self.editedRange,
        NSString(string: textContent.string).lineRange(
          for: NSMakeRange(self.editedRange.location, 0)))
      
      range = NSUnionRange(
        self.editedRange,
        NSString(string: textContent.string).lineRange(
          for: NSMakeRange(NSMaxRange(self.editedRange), 0)))
      
      applyStyles(range: range)
      super.processEditing()
    }
    
  }
