//
//  Report.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class Report: NSObject {
  var id: String!
  var reporter: User?
  var category: Category!
  var votesCount = 0
  var photos: [Photo]?
  var location: Location?
  var createdAt: NSDate!
  var modifiedAt: NSDate!

  func reportedAnnonymously() -> Bool {
    if let _ = reporter {
      return true
    }
    return false
  }
}
