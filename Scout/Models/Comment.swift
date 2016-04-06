//
//  Comment.swift
//  Scout
//
//  Created by Hieu Rocker on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class Comment: NSObject {
  var id: String!
  var user: User!
  var message: String?
  var createdAt: NSDate!
}
