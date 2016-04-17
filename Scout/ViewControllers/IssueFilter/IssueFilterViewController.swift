//
//  IssueFilterViewController.swift
//  Scout
//
//  Created by Hoi Pham Ngoc on 4/17/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import Eureka
import Parse
class IssueFilterViewController: FormViewController {
  var listRegions: [String] = []
  var regionName: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    initializeForm()
    let formValues = form.values()
    print(formValues)
  }
  func initializeForm() {
    form  +++=
      Section("QUICK FILTER")
      <<< CheckRow() {
        $0.title = "Just update"
        $0.value = true
      }
      <<< CheckRow() {
        $0.title = "Trending"
        $0.value = false
      }
      <<< CheckRow() {
        $0.title = "Critical"
        $0.value = false
    }
    form +++=
      Section("ORDER BY")
      <<< SegmentedRow<String>() {
        $0.options = ["Distance", "Rating", "Critical", "Popularity"]
    }
    form +++=
      Section ("REGION")
      <<< ActionSheetRow<String>() {
        $0.title = "Region"
        $0.selectorTitle = "Chose region"
        $0.options = ["Thanh Hoa","Phu Yen", "Quang Ninh", "Vinh Long","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh","Thanh Hoa","Phu Yen", "Quang Ninh"]
        $0.value = "Phu Yen"
        
    }
    form +++=
      Section ("OTHER")
      <<< CheckRow() {
        $0.title = "Sample 1"
        $0.value = false
      }
      <<< CheckRow() {
        $0.title = "Sample 2"
        $0.value = false
      }
      <<< CheckRow() {
        $0.title = "Sample 3"
        $0.value = false
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
