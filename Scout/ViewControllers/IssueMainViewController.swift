//
//  IssueMainViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import GoogleMaps
class IssueMainViewController: UIViewController {
  
  
  @IBOutlet weak var mainMapView: UIView!
  let cllocationManager: CLLocationManager = CLLocationManager()
  let locationManager = CLLocationManager()
  var googleMaps: GMSMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Request for location authorization
    //Request location authorization
    self.cllocationManager.requestAlwaysAuthorization()
    self.cllocationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
      cllocationManager.startUpdatingLocation()
    }
    // Do any additional setup after loading the view.
  }
  //Add Google Maps to the view
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    self.googleMaps = GMSMapView(frame: self.view.frame)
    self.view.addSubview(self.googleMaps)
  }
  
  
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == CLAuthorizationStatus.AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
    }
  }

  @IBAction func onIssueFilterClicked(sender: AnyObject) {
    let issueFilterVC = IssueFilterViewController(nibName: "IssueFilterViewController", bundle: nil)
    presentViewController(issueFilterVC, animated: true, completion: nil)
  }
  
  @IBAction func onIssueListClicked(sender: AnyObject) {
    let issueListVC = IssueListViewController(nibName: "IssueListViewController", bundle: nil)
    presentViewController(issueListVC, animated: true, completion: nil)
    
  }
  
  @IBAction func onIssueDetailsClicked(sender: UIButton) {
    let issueDetailsVC = IssueDetailsViewController(nibName: "IssueDetailsViewController", bundle: nil)
    presentViewController(issueDetailsVC, animated: true, completion: nil)
  }
  
  
  @IBAction func onProfileClicked(sender: UIButton) {
    let profileHomeVC = ProfileHomeViewController(nibName: "ProfileHomeViewController", bundle: nil)
    presentViewController(profileHomeVC, animated: true, completion: nil)
  }
}
extension IssueMainViewController: CLLocationManagerDelegate {
}