//
//  ScoutAPIRouter.swift
//  Scout
//
//  Created by Johnny Pham on 4/15/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Alamofire


enum ScoutAPIRouter: URLRequestConvertible {
  static let baseURLString:String = "https://api.parse.com/1/classes"
  
  case GetListIssue()               // GET https://api.parse.com/1/classes/Issue
  case GetListCategory()            // GET https://api.parse.com/1/classes/Category
  case GetListRegion()              // GET https://api.parse.com/1/classes
  case GetAtPath(String)            // GET at given path
  case IsStarred(String)            // GET https://api.github.com/gists/\(gistId)/star
  case Star(String)                 // PUT https://api.github.com/gists/\(gistId)/star
  case Unstar(String)               // DELETE https://api.github.com/gists/\(gistId)/star
  case Create([String: AnyObject])  // POST https://api.github.com/gists
  case Delete(String)               // DELETE https://api.github.com/gists/\(gistId)
  
  var URLRequest: NSMutableURLRequest {
    var method: Alamofire.Method {
      switch self {
      case .GetListIssue, .GetListCategory, .GetListRegion:
        return .GET
      default:
        return .GET
      }
    }
    
    let url:NSURL = {
      // build up and return the URL for each endpoint
      let relativePath:String?
      switch self {
      case .GetAtPath(let path):
        // already have the full URL, so just return it
        return NSURL(string: path)!
      // The rest of the paths are all relative
      case .GetListIssue:
        relativePath = "/Issue"
      case .GetListCategory:
        relativePath = "/Category"
      case .GetListRegion:
        relativePath = "/Region"
      default:
        return NSURL(string: "scout.io")!
      }
      
      var URL = NSURL(string: ScoutAPIRouter.baseURLString)!
      if let relativePath = relativePath {
        URL = URL.URLByAppendingPathComponent(relativePath)
      }
      return URL
    }()
    
    let params: ([String: AnyObject]?) = {
      switch self {
      case .GetListIssue, .GetListCategory, .GetListRegion, .GetAtPath:
        return (nil)
      default:
        return (nil)
      }
    }()
    
    let URLRequest = NSMutableURLRequest(URL: url)
    print("AppID", PrivateConfig.parseClientId!)
    URLRequest.setValue(PrivateConfig.parseApplicationId!, forHTTPHeaderField: "X-Parse-Application-Id")
    URLRequest.setValue(PrivateConfig.parseApiKey!, forHTTPHeaderField: "X-Parse-REST-API-Key")
    // Set OAuth token if we have one
    
    if let token = ScoutAPIManager.sharedInstance.OAuthToken {
      URLRequest.setValue("token \(token)", forHTTPHeaderField: "Authorization")
    }
    
    let encoding = Alamofire.ParameterEncoding.JSON
    let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
    
    encodedRequest.HTTPMethod = method.rawValue
    
    return encodedRequest
  }
}