//
//  PieClockView.swift
//  5623_09_code
//
//  Created by Stuart Grimshaw on 31/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

let π:CGFloat = CGFloat(M_PI)

@IBDesignable
class PieClockView: NSView
{
  @IBInspectable var darkColor: NSColor = .orange
  @IBInspectable var lightColor: NSColor = .white
  
  fileprivate var center: CGPoint {
    return CGPoint(x: bounds.midX,
                   y: bounds.midY)
  }
  
  var timeHours: CGFloat = 11.0
  var timeMinutes: CGFloat = 42.0
  
  var context: CGContext {
    return NSGraphicsContext.current()!.cgContext
  }
  
  let numberRectSize: CGFloat = 25.0
  
  override func draw(_ dirtyRect: NSRect)
  {
    super.draw(dirtyRect)
    
    NSColor.white.setFill()
    NSRectFill(bounds)
    
//    context.scaleBy(x: 1.0, y: 0.5)
    drawFace(clockRect: bounds)
    drawMinutes(minutes: timeMinutes, clockRect: bounds)
    drawHours(context: context, hours: timeHours, clockRect: bounds)
  }
  
}

extension PieClockView
{
  func drawFace(clockRect: CGRect)
  {
    let circle = NSBezierPath(ovalIn: clockRect)
    
    if let gradient = NSGradient(
      starting: darkColor,
      ending: lightColor)
    {
      gradient.draw(in: circle, angle: 90.0)
    }
  }
  
  
  func drawMinutes(minutes: CGFloat,
                   clockRect: CGRect)
  {
    let sweep: CGFloat = (60.0 - minutes) / 60.0 * 360
    let radius = min(clockRect.size.width,
                     clockRect.size.height) / 2.0
    let path = NSBezierPath()
    path.move(to: center)
    path.appendArc(withCenter: center,
                   radius: radius,
                   startAngle: 90.0,
                   endAngle: 90.0 + sweep)
    path.close()
    //    darkColor.setFill()
    //    path.fill()
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    let colors = [darkColor.cgColor,
                  lightColor.cgColor,
      //                  darkColor.cgColor,
      //                  lightColor.cgColor,
      //                  darkColor.cgColor
    ]
    
    let colorLocations:[CGFloat] = [0.0,
//                                  0.3, 0.5, 0.7,
                                    1.0]
    
    let gradient = CGGradient(colorsSpace: colorSpace,
                              colors: colors as CFArray,
                              locations: colorLocations)!
    
    let startPoint = CGPoint(x: 0.0,
                             y: 0.0)
    
    let endPoint = CGPoint(x:bounds.width,
                           y:0.0)
    
    context.saveGState()
    
    path.addClip()
    
    context.drawLinearGradient(
      gradient,
      start: startPoint,
      end: endPoint,
      options: [])
    
    context.restoreGState()
  }
  
  func drawHours(context: CGContext,
                 hours: CGFloat,
                 clockRect: CGRect)
  {
    context.saveGState()
    
     // shadow
//    context.setShadow(
//      offset: CGSize(width: 3.0, height: -5.0),
//      blur: 2,
//      color: NSColor.gray.cgColor)
    
    let numbersRadius = (min(
      clockRect.size.width,
      clockRect.size.height) - numberRectSize) / 2.0
    
    let numberRect = CGRect(
      x: 0 - numberRectSize * 0.5,
      y: numbersRadius - numberRectSize / 2,
      width: numberRectSize,
      height: numberRectSize)
    
//    let path = NSBezierPath(rect: numberRect)
//    NSColor.white.setFill()
    
    context.translateBy(x: bounds.width * 0.5,
                        y: bounds.height * 0.5)
    
    let textAttributes = hourTextAttributes(clockRect: clockRect)
    
    for i in 0..<12
    {
      context.saveGState()
      
      let rotation = 2.0 * π / 12.0 * (CGFloat(i) + hours)
      context.rotate(by: rotation)
      
      let numberString = "\(12 - i)"
      numberString.draw(in: numberRect,
                        withAttributes: textAttributes)
      
      context.restoreGState()
    }
    
    context.restoreGState()
  }
  
  func hourTextAttributes(clockRect: CGRect) -> [String: Any]
  {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    
    let textSize = min(clockRect.size.width,
                       clockRect.size.height) * 0.08
    
    let textAttributes: [String: Any] = [
      NSParagraphStyleAttributeName: paragraphStyle,
      NSFontAttributeName: NSFont(name: "Verdana",
                                  size: textSize)!]
    return textAttributes
  }
}
