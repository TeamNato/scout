//
//  Vote.swift
//  Scout
//
//  Created by redphx on 4/18/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Vote: PFObject, PFSubclassing {
  @NSManaged var issue: Issue
  @NSManaged var user: User
  
  class func parseClassName() -> String {
    return "Vote"
  }
}