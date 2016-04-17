//
//  IssueDetailsViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import ImageSlideshow
import GoogleMaps

class IssueDetailsViewController: UIViewController {
  var issue: Issue?
  @IBOutlet weak var photosSlideshow: ImageSlideshow!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var locationNameLabel: UILabel!
  @IBOutlet weak var locationMap: GMSMapView!
  
  var transitionDelegate: ZoomAnimatedTransitioningDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()

    if let issue = issue {
      let photos = issue.photos
      var sources = [AlamofireSource]()
      if photos.count > 0 {
        for photo in photos {
          let source = AlamofireSource(urlString: photo.url)
          sources.append(source!)
        }
        
        photosSlideshow.circular = true
        photosSlideshow.zoomEnabled = true
        photosSlideshow.contentScaleMode = .ScaleAspectFill
        photosSlideshow.slideshowInterval = 2000
        
        photosSlideshow.setImageInputs(sources)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(IssueDetailsViewController.viewPhotoFullscreen))
        photosSlideshow.addGestureRecognizer(recognizer)
      }
      
      titleLabel.text = issue.title
      //descriptionLabel.text = issue.objectForKey("description") as? String
      
      userLabel.text = issue.reporter.fullName()
      userImage.af_setImageWithURL(NSURL(string: issue.reporter.avatarURL)!)
      
      locationNameLabel.text = issue.locationName
      let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: issue.locationCoordinate.latitude, longitude: issue.locationCoordinate.longitude), zoom: 16, bearing: 0, viewingAngle: 0)
      locationMap.camera = camera
      
      let marker = GMSMarker()
      marker.position = CLLocationCoordinate2DMake(issue.locationCoordinate.latitude, issue.locationCoordinate.longitude)
      marker.map = locationMap
    }
  }
  
  @IBAction func onBackTapped(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func viewPhotoFullscreen() {
    let ctr = FullScreenSlideshowViewController()
    ctr.pageSelected = {(page: Int) in
      self.photosSlideshow.setScrollViewPage(page, animated: false)
    }
    
    ctr.initialPage = photosSlideshow.scrollViewPage
    ctr.inputs = photosSlideshow.images
    self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: photosSlideshow);
    ctr.transitioningDelegate = self.transitionDelegate!
    self.presentViewController(ctr, animated: true, completion: nil)
  }

}
