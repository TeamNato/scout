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
  
  var mapview: GMSMapView?
  let locationManager = CLLocationManager()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    
    let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: 10.7807514, longitude: 106.7043346), zoom: 17, bearing: 0, viewingAngle: 0)
    
    mapview = GMSMapView(frame: CGRectMake(0, 45, self.view.bounds.width, self.view.bounds.height - super.tabBarController!.tabBar.bounds.height - 20))
    
    mapview!.camera = camera
    mapview!.myLocationEnabled = true
    mapview!.settings.myLocationButton = true
    mapview!.settings.compassButton = true
    self.view.addSubview(mapview!)
    
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2DMake(10.7807514, 106.7043346)
    marker.title = "Ngo Van Nam"
    marker.snippet = "Description"
    marker.map = mapview
    
    // Do any additional setup after loading the view.
  }
  
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == CLAuthorizationStatus.AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
      mapview!.myLocationEnabled = true
      mapview!.settings.myLocationButton = true
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
extension IssueMainViewController: GMSMapViewDelegate {
}