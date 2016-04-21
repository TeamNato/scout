//
//  Region.swift
//  Scout
//
//  Created by Hoi Pham Ngoc on 4/17/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse

class Region: PFObject, PFSubclassing {
  @NSManaged var id: String
  @NSManaged var name: String
  
  class func parseClassName() -> String {
    return "Region"
  }
}
