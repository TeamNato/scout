//
//  IssueMainViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
class IssueMainViewController: UIViewController {
  
  @IBOutlet weak var mainMapView: GMSMapView!
  
  let cllocationManager: CLLocationManager = CLLocationManager()
  @IBOutlet weak var addressLabel: UILabel!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //Request location authorization
    self.cllocationManager.requestAlwaysAuthorization()
    self.cllocationManager.requestWhenInUseAuthorization()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled() {
      cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
      cllocationManager.startUpdatingLocation()
    }
    
    // Do any additional setup after loading the view.
    
    mainMapView.delegate = self

  }
  
  func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
    let geocoder = GMSGeocoder()
    geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
      if let address = response?.firstResult() {
        print("address")
        UIView.animateWithDuration(0.25) {
          self.view.layoutIfNeeded()
        }
      }
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
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == .AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
      // Add map optionals
      mainMapView.myLocationEnabled = true
      mainMapView.settings.myLocationButton = true
      mainMapView.settings.myLocationButton = true
      
    }
  }
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    mainMapView.settings.myLocationButton = true
    if let location = locations.first {
      mainMapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
      locationManager.stopUpdatingLocation()
    }
  }
  
}
extension IssueMainViewController: GMSMapViewDelegate {
  func mainMapView(mainMapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
    reverseGeocodeCoordinate(position.target)
  }
}