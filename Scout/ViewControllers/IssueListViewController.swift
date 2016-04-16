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
import Parse
class IssueListViewController: UIViewController {
  
  var issues = [Issue]()
  var nextPageURLString: String?
  var isLoading = false
  var dateFormatter = NSDateFormatter()
  var notConnectedBanner: Banner?
  
  @IBOutlet weak var tableView: UITableView!
  private var refreshControl = UIRefreshControl!()
  private var loadingAdditionalIssues = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    // Refresh control
    loadIssues()
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    
  }
  
  override func viewWillDisappear(animated: Bool) {
    if let existingbanner = self.notConnectedBanner{
      existingbanner.dismiss()
    }
    super.viewWillAppear(animated)
  }
  
  func loadIssues() {
    if self.isLoading == false {
      self.isLoading = true
      var lastMessage = issues.last
      var query = PFQuery(className: PF_ISSUE_CLASS_NAME)
      query.includeKey(PF_ISSUE_REPORTER)
      query.orderByDescending(PF_ISSUE_CREATEDAT)
      query.limit = 50
      query.findObjectsInBackgroundWithBlock {
        (objects: [PFObject]?, error: NSError?) -> Void in
        if error == nil {
          // The find succeeded.
          print("Successfully retrieved \(objects!.count) scores.")
          // Do something with the found objects
          for object in (objects as! [PFObject]!).reverse() {
            self.addIssue(object)
          }
        } else {
          // Log details of the failure
          print("Error: \(error!) \(error!.userInfo)")
        }
        self.tableView.reloadData()
      }

      
      
    }
  }
  
  func addIssue(object: PFObject) {
     print(object)
  }
  
  // MARK: - Pull to Refresh
  func refresh(sender:AnyObject) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setBool(false, forKey: "loadingOAuthToken")
    
    nextPageURLString = nil // so it doesn't try to append the results
    loadInitialData()
  }
  func loadInitialData() {
    self.loadIssues()
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  } 
  
}
// MARK: - UITableViewDataSource
extension IssueListViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return issues.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
    
    let issue = issues[indexPath.row]
    cell.textLabel!.text = issue.title
    return cell
  }
  
  
//  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    
//    let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
//    let issue = issues[indexPath.row]
//    cell.textLabel!.text = issue.objectId
//    cell.detailTextLabel!.text = issue.description
//    cell.imageView?.image = nil
//    // See if we need to load more gists
//    let rowsToLoadFromBottom = 5;
//    let rowsLoaded = issues.count
//   
//    return cell
//  }
  
}

// MARK: - UITableViewDelegate
extension IssueListViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}
 