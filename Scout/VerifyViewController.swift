//
//  VerifyViewController.swift
//  Scout
//
//  Created by redphx on 4/9/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func onLaterTapped(sender: UIButton) {
    let vc = MainViewController(nibName: "MainViewController", bundle: nil)
    presentViewController(vc, animated: true, completion: nil)
  }
}
