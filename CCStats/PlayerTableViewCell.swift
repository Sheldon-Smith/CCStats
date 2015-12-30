//
//  PlayerTableViewCell.swift
//  CCStats
//
//  Created by Graham Schilling on 12/30/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var playerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
