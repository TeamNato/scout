//
//  PlaceMaker.swift
//  Scout
//
//  Created by Hoi Pham Ngoc on 4/24/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation
import GoogleMaps

class PlaceMaker: GMSMarker {
  let place: GooglePlace
  init(place: GooglePlace) {
    self.place = place
    super.init()
    
    position = place.coordinate
    icon = UIImage(named: place.placeType+"_pin")
    groundAnchor = CGPoint(x: 0.5, y: 1)
    appearAnimation = kGMSMakerAnimationPop
    
  }
}