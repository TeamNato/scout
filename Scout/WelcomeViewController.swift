//
//  WelcomeViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func onLogInClicked(sender: UIButton) {
    let logInVC = LogInViewController(nibName: "LogInViewController", bundle: nil)
    dismissViewControllerAnimated(false, completion: nil)
    presentViewController(logInVC, animated: true, completion: nil)
  }
}
