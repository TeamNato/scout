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
  
  func isVotedByUser(user: PFUser, callback: (Bool) -> Void) -> Void {
    let query = PFQuery(className: PF_VOTE_CLASS_NAME)
    query.whereKey("user", equalTo: user)
    query.whereKey("issue", equalTo: self)
    query.countObjectsInBackgroundWithBlock { (count, error) in
      callback(count > 0)
    }
  }
  
  func updateVoteStatus(isVoted: Bool, user: PFUser, callback: () -> Void) -> Void {
    if isVoted {
      let pfVote = PFObject(className: "Vote")
      pfVote["user"] = user
      pfVote["issue"] = self
      pfVote.saveInBackground()
      callback()
    } else {
      let query = PFQuery(className: PF_VOTE_CLASS_NAME)
      query.whereKey("user", equalTo: user)
      query.whereKey("issue", equalTo: self)
      query.getFirstObjectInBackgroundWithBlock({ (obj, error) in
        if let obj = obj {
          obj.deleteInBackground()
          callback()
        }
      })
    }
  }
}
