//
//  Comment.swift
//  Scout
//
//  Created by Hieu Rocker on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Comment: PFObject, PFSubclassing {
  @NSManaged var id: String
  @NSManaged var user: User
  @NSManaged var message: String
  
  class func parseClassName() -> String {
    return "Comment"
  }
}