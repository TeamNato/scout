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
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        issueImage.layer.cornerRadius = 5
        issueImage.layer.masksToBounds = true
      
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
