//
//  CommentCell.swift
//  Scout
//
//  Created by redphx on 4/18/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import DateTools

class CommentCell: UITableViewCell {
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var commentLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  
  var comment: Comment? {
    didSet {
      if let comment = comment {
        avatarImage.af_setImageWithURL(NSURL(string: comment.user.avatarURL)!)
        nameLabel.text = comment.user.fullName()
        commentLabel.text = comment.message
        timeLabel.text = comment.createdAt?.shortTimeAgoSinceNow()
      }
      
    }
  }
}
