//
//  ScoutAPIManager.swift
//  Scout
//
//  Created by Johnny Pham on 4/15/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ScoutAPIManager {
  static let sharedInstance = ScoutAPIManager()
  var alamofireManager: Alamofire.Manager
  static let ErrorDomain = "com.error.ScoutAPIManger"
  
  let clientID: String = PrivateConfig.parseClientId!
  let applicationID: String = PrivateConfig.parseApplicationId!
  
  
  
  init () {
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    alamofireManager = Alamofire.Manager(configuration: configuration)
  }
  
  
  func printListIssue() -> Void {
    alamofireManager.request(ScoutAPIRouter.GetListIssue())
      .responseString { response in
        if let receivedString = response.result.value {
          print(receivedString)
        }
        
    }
    
    
  }
  
  var OAuthToken: String? {
    return nil
  }
  
  func clearCache() {
    let cache = NSURLCache.sharedURLCache()
    cache.removeAllCachedResponses()
  }
  
  
}