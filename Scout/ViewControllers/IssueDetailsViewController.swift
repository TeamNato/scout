//
//  IssueDetailsViewController.swift
//  Scout
//
//  Created by redphx on 4/7/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import ImageSlideshow

class IssueDetailsViewController: UIViewController {
  var issue: Issue?
  @IBOutlet weak var photosSlideshow: ImageSlideshow!
  @IBOutlet weak var titleLabel: UILabel!
  
  var transitionDelegate: ZoomAnimatedTransitioningDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let photos = issue?.photos
    var sources = [AlamofireSource]()
    if photos != nil && photos?.count > 0 {
      for photo in photos! {
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
