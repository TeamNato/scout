//
//  ParserClient.swift
//  Scout
//
//  Created by redphx on 4/8/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import ParseFacebookUtilsV4

class ParserClient: NSObject {
  static func initialize(launchOptions: [NSObject: AnyObject]?) {
    Parse.setApplicationId(PrivateConfig.parseApplicationId!, clientKey: PrivateConfig.parseClientId!)
    
    PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
    
    Category.registerSubclass()
    Comment.registerSubclass()
    Issue.registerSubclass()
    Photo.registerSubclass()
    User.registerSubclass()
    Region.registerSubclass()
    Vote.registerSubclass()
  }
}
