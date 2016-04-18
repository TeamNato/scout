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
  //@NSManaged var issueDescription: String
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
  
  func getComments(callback: ([Comment]) -> Void) -> Void {
    let query = PFQuery(className: PF_COMMENT_CLASS_NAME)
    query.includeKey(PF_COMMENT_USER)
    query.includeKey(PF_COMMENT_ISSUE)
    query.orderByDescending(PF_ISSUE_CREATEDAT)
    query.limit = 10
    query.findObjectsInBackgroundWithBlock {
      (objects: [PFObject]?, error: NSError?) -> Void in
      if error == nil {
        // The find succeeded.
        print("Successfully retrieved \(objects!.count) objects.")
        // Do something with the found objects
        if let objects = objects {
          callback(objects as! [Comment])
        }
      } else {
        // Log details of the failure
        print("Error: \(error!) \(error!.userInfo)")
      }
      
    }
  }
}
