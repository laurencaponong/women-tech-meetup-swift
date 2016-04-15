//
//  MeetupCustomTableViewCell.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/14/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit

class MeetupCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var meetupNameLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
