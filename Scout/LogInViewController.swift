//
//  LogInViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func onLogInClicked(sender: UIButton) {
    let mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
    UIApplication.sharedApplication().keyWindow?.rootViewController = mainVC
    //presentViewController(mainVC, animated: true, completion: nil)
  }
}
