//
//  ProfileHomeViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class ProfileHomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func onBackClicked(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
}
