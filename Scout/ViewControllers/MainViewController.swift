//
//  MainViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
  enum TabBars: Int {
    case Search = 0
    case Add
    case More
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate = self
    
    let issueMainVC = IssueMainViewController(nibName: "IssueMainViewController", bundle: nil)
    issueMainVC.tabBarItem.title = "Issues"
    
    let issueSubmitVC = UIViewController()
    issueSubmitVC.tabBarItem.title = "Add"
    issueSubmitVC.tabBarItem.tag = TabBars.Add.rawValue
    
    let moreVC = MoreViewController(nibName: "MoreViewController", bundle: nil)
    moreVC.tabBarItem.title = "More"
    
    viewControllers = [issueMainVC, issueSubmitVC, moreVC]

  }
}

extension MainViewController: UITabBarControllerDelegate {
  func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
    if viewController.tabBarItem.tag == TabBars.Add.rawValue {
      let issueSubmitVC = IssueSubmitViewController(nibName: "IssueSubmitViewController", bundle: nil)
      presentViewController(issueSubmitVC, animated: true, completion: nil)
      return false
    }
    return true
  }
}