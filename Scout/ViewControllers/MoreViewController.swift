//
//  MoreViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }  
  @IBAction func onLogOutTapped(sender: UIButton) {
    User.localUser = nil
    PFUser.logOutInBackgroundWithBlock { (error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      let vc = WelcomeViewController(nibName: "WelcomeViewController", bundle: nil)
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      appDelegate.window?.rootViewController = vc
    }
  }
}
