//
//  Issue.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Issue: PFObject, PFSubclassing {
  @NSManaged var id: String
  @NSManaged var title: String
  @NSManaged var issueDescription: String
  @NSManaged var reporter: User
  @NSManaged var category: Category
  @NSManaged var votesCount: Int
  @NSManaged var commentsCount: Int
  @NSManaged var photos: [Photo]
  @NSManaged var locationCoordinate: PFGeoPoint
  @NSManaged var locationName: String
  @NSManaged var modifiedAt: NSDate
  @NSManaged var isAnonymous: Bool

  class func parseClassName() -> String {
    return "Issue"
  }
}
