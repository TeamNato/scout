//
//  Issue.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import SwiftyJSON

class Issue: NSObject {
  var id: String!
  var title: String!
  var issueDescription: String?
  var reporter: User?
  var category: Category!
  var votesCount = 0
  var photos: [Photo]?
  var location: Location?
  var createdAt: NSDate!
  var modifiedAt: NSDate!
  var isAnonymous: Bool?
}
