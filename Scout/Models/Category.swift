//
//  Category.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Category: PFObject, PFSubclassing {
  @NSManaged var id: String
  @NSManaged var name: String
  @NSManaged var iconUrl: NSURL
  
  class func parseClassName() -> String {
    return "Category"
  }
}