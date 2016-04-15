//
//  Report.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import SwiftyJSON

class Report: NSObject, ResponseJSONObjectSerializable {
  var id: String!
  var issueDescription: String?
  var reporter: User?
  var category: Category!
  var votesCount = 0
  var photos: [Photo]?
  var location: Location?
  var createdAt: NSDate!
  var modifiedAt: NSDate!
  var isAnonymous: Bool?
  
  static let sharedDateFormatter = Report.dateFromatter()
  
  
  var reportedAnnonymously: Bool {
    get {
      if let _ = reporter {
        return true
      }
      return false
    }
  }
  
  
  required init?(json: JSON) {
    // Basic field
    self.id = json["objectId"].string
    self.issueDescription = json["description"].string
    self.isAnonymous = json["isAnonymous"].bool
    
    
    // For Date
    let dateFormatter = Report.sharedDateFormatter
    if let dateString = json["createdAt"].string {
      self.createdAt = dateFormatter.dateFromString(dateString)
    }
    if let dateString = json["updatedAt"].string {
      self.createdAt = dateFormatter.dateFromString(dateString)
    }
    
  }
  
  
  
  
  required override init() {
    
  }
  
  class func dateFromatter() -> NSDateFormatter {
    let aDateFormatter = NSDateFormatter()
    aDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    aDateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
    aDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    return aDateFormatter
  }
  
  
}
