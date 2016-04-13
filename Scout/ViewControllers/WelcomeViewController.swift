//
//  WelcomeViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import ParseFacebookUtilsV4

class WelcomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func onLogInClicked(sender: UIButton) {
    PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile", "email"]) { (user, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      if let currentUser = User.currentUser {
        var vc: UIViewController?
        if currentUser.phoneVerified {
          vc = MainViewController(nibName: "MainViewController", bundle: nil)
        } else {
          vc = VerifyViewController(nibName: "VerifyViewController", bundle: nil)
        }
        self.presentViewController(vc!, animated: true, completion: nil)
      }
    }
  }
}
