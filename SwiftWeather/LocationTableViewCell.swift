//
//  LocationTableViewCell.swift
//  SwiftWeather
//
//  Created by CNTT-MAC on 12/28/18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherLocation: UILabel!
    @IBOutlet weak var weatherStatus: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

