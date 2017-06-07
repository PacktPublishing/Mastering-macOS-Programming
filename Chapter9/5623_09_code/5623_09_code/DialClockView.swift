//
//  DialClockView.swift
//  5623_09_code
//
//  Created by Stuart Grimshaw on 31/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

@IBDesignable
class DialClockView: NSView
{
  @IBInspectable var outlineColor: NSColor = .orange
  @IBInspectable var innerColor: NSColor = .white
  @IBInspectable var lineColor: NSColor = .gray
  
  let timeHours: CGFloat = 8.0
  let timeMinutes: CGFloat = 42.0
  
  var radius: CGFloat {
    return min(bounds.width,
               bounds.height) * 0.4
  }
  var radiusHours: CGFloat {
    return bounds.width * 0.2
  }
  var radiusMinutes: CGFloat {
    return bounds.width * 0.3
  }
  var center: CGPoint {
    return CGPoint(x:bounds.width / 2.0,
                   y: bounds.height / 2.0)
  }
  
  override func draw(_ dirtyRect: NSRect)
  {
    super.draw(dirtyRect)
    
    NSColor.white.setFill()
    NSRectFill(dirtyRect)
    
    let path = NSBezierPath()
    path.appendArc(withCenter: center,
                   radius: radius,
                   startAngle: 0.0,
                   endAngle: 180.0)
    path.appendArc(withCenter: center,
                   radius: radius * 0.25,
                   startAngle: 180.0,
                   endAngle: 0.0,
                   clockwise: true)
    path.close()
    
    // fill
    innerColor.setFill()
    path.fill()
    
    // minutes
    let pathMinutes = NSBezierPath()
    pathMinutes.lineWidth = 4
//    pathMinutes.lineCapStyle = .roundLineCapStyle
    let dashes: [CGFloat] = [10, 5]
    pathMinutes.setLineDash(dashes, count: 2, phase: 0)
    
    let arcSweepMinutes = CGFloat(timeMinutes) / 60.0 * 180.0
    pathMinutes.appendArc(withCenter: center,
                          radius: radiusMinutes,
                          startAngle: 180.0,
                          endAngle: 180.0 - arcSweepMinutes,
                          clockwise: true)
    lineColor.setStroke()
    pathMinutes.stroke()

    // hours
    let pathHours = NSBezierPath()
    pathHours.lineWidth = 5
    
    let arcSweepHours = CGFloat(timeHours) / 12.0 * 180.0
    pathHours.appendArc(withCenter: center,
                        radius: radiusHours,
                        startAngle: 180.0,
                        endAngle: 180.0 - arcSweepHours,
                        clockwise: true)
    
    lineColor.setStroke()
    pathHours.stroke()

    // outline
    outlineColor.setStroke()
    path.lineWidth = 4
    //    path.lineJoinStyle = .roundLineJoinStyle
    path.stroke()
  }
  
}
