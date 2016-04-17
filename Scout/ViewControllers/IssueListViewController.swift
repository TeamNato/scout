//
//  IssueListViewController.swift
//  Scout
//
//  Created by Johnny Pham on 4/15/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import BRYXBanner
import Parse
class IssueListViewController: UIViewController {
  
  var issues = [Issue]()
  var imageUrl: String?
  var nextPageURLString: String?
  var isLoading = false
  var dateFormatter = NSDateFormatter()
  var notConnectedBanner: Banner?
  @IBOutlet weak var tableView: UITableView!
  private var refreshControl = UIRefreshControl()
  private var loadingAdditionalIssues = false
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initTableView()
    // Refresh control
    loadIssues()
  }

  func initTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView.registerNib(UINib(nibName: "IssueListCell", bundle: nil), forCellReuseIdentifier: "IssueListCell")
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.estimatedRowHeight = 106
  }

  func loadIssues() {
    if self.isLoading == false {
      self.isLoading = true
      //var lastMessage = issues.last
      let query = PFQuery(className: PF_ISSUE_CLASS_NAME)
      query.includeKey(PF_ISSUE_REPORTER)
      query.includeKey(PF_ISSUE_PHOTOS)
      query.orderByDescending(PF_ISSUE_CREATEDAT)
      query.limit = 10
      query.findObjectsInBackgroundWithBlock {
        (objects: [PFObject]?, error: NSError?) -> Void in
        if error == nil {
          // The find succeeded.
          print("Successfully retrieved \(objects!.count) scores.")
          // Do something with the found objects
          if let objects = objects {
            self.issues = objects as! [Issue]
          }
        } else {
          // Log details of the failure
          print("Error: \(error!) \(error!.userInfo)")
        }
        self.tableView.reloadData()
      }
    }
  }
}

// MARK: - UITableViewDataSource
extension IssueListViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("IssueListCell") as! IssueListCell
    let issue = issues[indexPath.row]
    cell.issue = issue
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return issues.count
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let issue = self.issues[indexPath.row];
    
    let detailsVC = IssueDetailsViewController(nibName: "IssueDetailsViewController", bundle: nil)
    detailsVC.issue = issue
    presentViewController(detailsVC, animated: true, completion: nil)
  }
  
}

extension IssueListViewController: UITableViewDelegate {

}