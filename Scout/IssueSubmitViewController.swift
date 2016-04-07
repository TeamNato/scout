//
//  IssueSubmitViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class IssueSubmitViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func onCancelClicked(sender: UIBarButtonItem) {
    // TODO: confirm dialog

    dismissViewControllerAnimated(true, completion: nil)
  }
}
