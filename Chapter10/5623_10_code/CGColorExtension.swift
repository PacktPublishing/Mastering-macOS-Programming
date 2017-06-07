//
//  CGColorExtension.swift
//  5623_11_code
//
//  Created by Stuart Grimshaw on 20/11/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

extension CGColor
{
  static var white: CGColor {
    return CGColor(red: 1, green: 1, blue: 1, alpha: 1)}
  static var black: CGColor {
    return CGColor(red: 0, green: 0, blue: 0, alpha: 1)}
  static var paleGray: CGColor {
    return CGColor(gray: 0.9, alpha: 1.0)}
  static var silver: CGColor {
    return CGColor(gray: 0.5, alpha: 0.7)}
  
  static var transparentGold: CGColor {
    return CGColor(genericCMYKCyan: 0.1,
                   magenta: 0.2,
                   yellow: 0.8,
                   black: 0.0,
                   alpha: 0.7)}
  
  static var gold: CGColor {
    return CGColor(genericCMYKCyan: 0.1,
                   magenta: 0.2,
                   yellow: 0.8,
                   black: 0.0,
                   alpha: 1.0)}
  
  static var niceRed: CGColor {
    return CGColor(genericCMYKCyan: 0.4,
                   magenta: 0.9,
                   yellow: 0.7,
                   black: 0.0,
                   alpha: 0.7)}
}
