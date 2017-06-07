//
//  Report.swift
//  5623_17_code
//
//  Created by Stuart Grimshaw on 4/10/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class Report: CustomDebugStringConvertible
{
  var title:    String?
  var date:     Date?
  var approved: Bool?
  
  var debugDescription: String {
    return "\("Report")\n\(title)\n\(date)\n\(approved)"
  }
}
