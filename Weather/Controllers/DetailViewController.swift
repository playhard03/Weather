//
//  DetailViewController.swift
//  Weather
//
//  Created by Андрей Сергеевич on 08.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var cityName: UILabel!
    var city: String?
    var temperature: Double?
    
    var weather = WeatherData()
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
   
}
