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
  
  var issues = [PFObject]()
  var imageUrl: String?
  var nextPageURLString: String?
  var isLoading = false
  var dateFormatter = NSDateFormatter()
  var notConnectedBanner: Banner?
  
  @IBOutlet weak var tableView: UITableView!
  private var refreshControl = UIRefreshControl!()
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
      var lastMessage = issues.last
      var query = PFQuery(className: PF_ISSUE_CLASS_NAME)
      query.includeKey(PF_ISSUE_REPORTER)
      query.orderByDescending(PF_ISSUE_CREATEDAT)
      query.limit = 10
      query.findObjectsInBackgroundWithBlock {
        (objects: [PFObject]?, error: NSError?) -> Void in
        if error == nil {
          // The find succeeded.
          print("Successfully retrieved \(objects!.count) scores.")
          // Do something with the found objects
          if let objects = objects! as? [PFObject] {
            self.issues = objects
          }
        } else {
          // Log details of the failure
          print("Error: \(error!) \(error!.userInfo)")
        }
        self.tableView.reloadData()
      }
    }
  }
  func getImageURL(objectID: String) -> String{
    var query = PFQuery(className: PF_PHOTO_CLASS_NAME)
    var imageUrl = ""
    query.whereKey("objectId", equalTo: objectID)
    query.findObjectsInBackgroundWithBlock {
      (objects: [PFObject]?, error: NSError?) -> Void in
      if error == nil {
        // The find succeeded.
        print("Successfully retrieved \(objects!.count) scores.")
        // Do something with the found objects
        if let objects = objects! as? [PFObject] {
          imageUrl = objects[0]["url"] as! String
          
        }
      } else {
        // Log details of the failure
        
      }
      self.tableView.reloadData()
    }
    
    return imageUrl
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
// MARK: - UITableViewDataSource
extension IssueListViewController: UITableViewDataSource, UITableViewDelegate{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("IssueListCell") as! IssueListCell
    let issue = issues[indexPath.row]
    cell.titleLabel!.text = issue.objectForKey("title") as? String
    cell.distantLabel!.text = "0.4 km"
    cell.locationLabel!.text = issue.objectForKey("locationName") as? String
    cell.voteLabel!.text = "\(issue.objectForKey("commentsCount")!)"
    cell.commentsCountLabel!.text = "\(issue.objectForKey("commentsCount")!)"
    let photoObjectId = issue.objectForKey("photos")![0].objectId as String?
    
    cell.issueImage!.af_setImageWithURL(NSURL(string: "https://unsplash.it/640/480?image=740")!)
//    cell.issueImage!.image = UIImage(data: imageData!, scale: UIScreen.mainScreen().scale)!
    
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return issues.count
  }
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0.01
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 5
  }
  
  
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let issue = self.issues[indexPath.section]; 
    
    let detailVc = IssueDetailsViewController(nibName: "IssueDetailsViewController", bundle: nil)
    detailVc.issue = issue
    self.navigationController?.pushViewController(detailVc, animated: true)
  }
  
}


 