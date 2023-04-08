//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Андрей Сергеевич on 08.04.2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tempCity: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var contidionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
