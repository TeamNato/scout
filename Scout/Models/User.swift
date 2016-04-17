//
//  User.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import Parse
import ParseFacebookUtilsV4

class User: PFUser {
  @NSManaged var id: String
  @NSManaged var firstName: String
  @NSManaged var lastName: String
  @NSManaged var avatarURL: String
  @NSManaged var reportsCount: Int
  @NSManaged var phoneVerified: Bool
  var pfUser: PFUser?
  
  static var _localUser: User?
  class var localUser: User? {
    get {
      if _localUser == nil {
        if let pfUser = PFUser.currentUser() {
          let user = User()
          user.firstName = (pfUser.objectForKey("firstName") as? String)!
          user.lastName = (pfUser.objectForKey("lastName") as? String)!
          user.phoneVerified = pfUser.objectForKey("phoneVerified") as? Bool ?? false
          user.pfUser = pfUser
          _localUser = user
          
          if let _ = FBSDKAccessToken.currentAccessToken() {
            let requestParams = ["fields": "id, email, first_name, last_name"]
            
            let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParams)
            
            userDetails.startWithCompletionHandler({ (connection, result, error) in
              if let error = error {
                print(error.localizedDescription)
                return
              }
              
              if let result = result as? NSDictionary {
                if let firstName = result["first_name"] as? String {
                  user.firstName = firstName
                  pfUser.setObject(firstName, forKey: "firstName")
                }
                if let lastName = result["last_name"] as? String {
                  user.lastName = lastName
                  pfUser.setObject(lastName, forKey: "lastName")
                }
                if let email = result["email"] as? String {
                  pfUser.setObject(email, forKey: "email")
                }
                
                pfUser.saveInBackgroundWithBlock({ (successed, error) in
                  if let error = error {
                    print(error.localizedDescription)
                    return
                  }
                  print("Updated Facebook profile successfully")
                })
              }
            })
          }
        }
      }
      return _localUser
    }
    
    set(user) {
      _localUser = user
    }
  }
  
  override class func parseClassName() -> String {
    return "_User"
  }
  
  func fullName() -> String {
    return firstName + " " + lastName
  }
}
