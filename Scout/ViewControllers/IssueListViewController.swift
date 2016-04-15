//
//  IssueListViewController.swift
//  Scout
//
//  Created by Johnny Pham on 4/15/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import Alamofire
import BRYXBanner
class IssueListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ScoutAPIManager.sharedInstance.printListIssue()
      
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
