//
//  User.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class User: NSObject {
  var id: String!
  var name: String!
  var avatarUrl: NSURL?
  var reportsCount = 0
  var settings: UserSettings?
}
