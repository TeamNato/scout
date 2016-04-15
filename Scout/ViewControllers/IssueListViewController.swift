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
class IssueListViewController: UIViewController, UITableViewController {
  
  var issues = [Issue]()
  var nextPageURLString: String?
  var isLoading = false
  var dateFormatter = NSDateFormatter()
  var notConnectedBanner: Banner?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ScoutAPIManager.sharedInstance.printListIssue()
    // Do any additional setup after loading the view.
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    // add refresh control for pull to refresh
    if (self.refreshControl == nil) {
      self.refreshControl = UIRefreshControl()
      self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
      self.refreshControl?.addTarget(self, action: #selector(IssueListViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
      self.dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
      self.dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
    }
  }
  
  override func viewWillDisappear(animated: Bool) {
    if let existingbanner = self.notConnectedBanner{
      existingbanner.dismiss()
    }
    super.viewWillAppear(animated)
  }
  
  func loadIssues(urlToLoad: String?) {
    self.isLoading = true
    let completionHandler: (Result<[Issue], NSError>, String?) -> Void =
      { (result, nextPage) in
        self.isLoading = false
        self.nextPageURLString = nextPage
        
        // Tell refresh control it can stop showing up now
        if self.refreshControl != nil && self.refreshControl!.refreshing {
          self.refreshControl?.endRefreshing()
        }
        guard result.error == nil else {
          print(result.error)
          self.nextPageURLString = nil
          self.isLoading = false
          if let error = result.error {
            if error.domain == NSURLErrorDomain {
              if error.code == NSURLErrorUserAuthenticationRequired {
                print("auth error")
              } else if error.code == NSURLErrorNotConnectedToInternet {
                let path:Path
                
                if let archived:[Issue] = PersistenceManager.loadArray(path) {
                  self.issues = archived
                } else {
                  self.issues = [] // don't have any saved issues
                }
                
                // show not connected error & tell em to try again when they do have a connection
                // check for existing banner
                if let existingBanner = self.notConnectedBanner {
                  existingBanner.dismiss()
                }
                self.notConnectedBanner = Banner(title: "No Internet Connection",
                                                 subtitle: "Could not load issues." +
                  " Try again when you're connected to the internet",
                                                 image: nil,
                                                 backgroundColor: UIColor.redColor())
              }
              self.notConnectedBanner?.dismissesOnSwipe = true
              self.notConnectedBanner?.show(duration: nil)
            }
          }
          return
        }
    }
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
