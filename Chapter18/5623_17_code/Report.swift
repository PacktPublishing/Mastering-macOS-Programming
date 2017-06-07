

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
