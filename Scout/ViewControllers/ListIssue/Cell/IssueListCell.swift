//
//  IssueListCell.swift
//  Scout
//
//  Created by Johnny Pham on 4/16/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit

class IssueListCell: UITableViewCell {
  
  @IBOutlet weak var issueImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var voteLabel: UILabel!
  @IBOutlet weak var commentsCountLabel: UILabel!
  @IBOutlet weak var distantLabel: UILabel!
  
  var issue: Issue? {
    didSet {
      titleLabel!.text = issue?.title
      distantLabel!.text = "0.4 km"
      locationLabel!.text = issue?.locationName
      voteLabel!.text = String(issue?.votesCount ?? 0)
      commentsCountLabel!.text = String(issue?.commentsCount ?? 0)

      let placeHolder = UIImage()
      if let photos = issue?.photos {
        issueImage!.af_setImageWithURL(NSURL(string: photos.first!.url)!, placeholderImage: placeHolder)
      } else {
        issueImage.image = placeHolder
      }
      
      issueImage.layer.cornerRadius = 5
      issueImage.layer.masksToBounds = true
    }
  }
}
