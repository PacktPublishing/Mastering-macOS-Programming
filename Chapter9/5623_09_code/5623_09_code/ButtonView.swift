//
//  ButtonView.swift
//  5623_09_code
//
//  Created by Stuart Grimshaw on 1/11/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

@IBDesignable
class ButtonView: NSButton
{
  @IBInspectable var borderColor: NSColor = .orange
  @IBInspectable var normalButtonColor: NSColor = .white
  @IBInspectable var highlightedButtonColor: NSColor = .gray
  
  @IBInspectable var roundIcon: Bool = true
  
  var fillColor: NSColor {
    return isHighlighted ?
      highlightedButtonColor :
    normalButtonColor
  }
  
  // sizes
  var standardLineWidth: CGFloat {
    return min(bounds.width, bounds.height) * 0.05
  }
  
  var insetRect: CGRect {
    return bounds.insetBy(
      dx: standardLineWidth ,
      dy: standardLineWidth )
  }
  
  var iconRect: CGRect {
    return insetRect.insetBy(
      dx: min(bounds.width, bounds.height) * 0.15,
      dy: min(bounds.width, bounds.height) * 0.15)
  }
  
  
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    // Drawing code here.
    
//    NSColor.black.setFill()
//    NSRectFill(dirtyRect)
    
    // circle
    let circlePath = NSBezierPath(ovalIn: insetRect)
    fillColor.setFill()
    circlePath.fill()
    
    circlePath.lineWidth = standardLineWidth
    borderColor.setStroke()
    circlePath.stroke()
    
    // icon
//    NSColor.gray.setFill()
//    NSRectFill(iconRect)
    
    let iconPath = NSBezierPath()
    if roundIcon == true
    {
      iconPath.appendOval(in: iconRect)
    }
    else
    {
      iconPath.appendArc(withCenter: CGPoint(x: iconRect.midX,
                                             y: iconRect.midY),
                         radius: min(iconRect.width, iconRect.height) /  2.0,
                         startAngle: 180.0,
                         endAngle: 0)
      iconPath.close()
    }
    
    iconPath.lineWidth = standardLineWidth
    borderColor.setStroke()
    iconPath.stroke()
  }
  
}
