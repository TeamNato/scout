//
//  PrivateConfig.swift
//  Scout
//
//  Created by redphx on 4/8/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class PrivateConfig: NSObject {
  static var GMSApiKey: String?
  static var parseApplicationId: String?
  static var parseClientId: String?
  static var parseApiKey: String?

  static func initConfig() -> Bool {
    let config = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("PrivateConfig", ofType: "plist")!)
    if config == nil {
      return false
    }
    
    GMSApiKey = config!["GMSApiKey"] as? String
    parseApplicationId = config!["ParseApplicationId"] as? String
    parseClientId = config!["ParseClientId"] as? String
    parseApiKey = config!["ParseApiKey"] as? String
    return true
  }
}
