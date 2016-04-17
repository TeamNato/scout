//
//  Photo.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Photo: PFObject, PFSubclassing {
  @NSManaged var id: String
  @NSManaged var width: Int
  @NSManaged var height: Int
  @NSManaged var url: String
  
  class func parseClassName() -> String {
    return "Photo"
  }
}
