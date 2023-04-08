//
//  WeaterTableViewController.swift
//  Weather
//
//  Created by Андрей Сергеевич on 08.04.2023.
//

import UIKit
import SDWebImage


class WeaterTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayCity = ["moscow","ufa","kazan","perm","london","dubai","toronto","washington","new-york"]
    var arrayRus = ["Москва","Уфа","Казань","Пермь","Лондон","Дубай","Торонто","Вашингтон","Нью-йорк"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func searchButton(_ sender: Any) {
        
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        tableView.reloadData()
    }
    
}

extension WeaterTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else{return UITableViewCell() }
        cell.cityLabel.text = "\(arrayRus[indexPath.row])"
        WeatherApiManager.shared.sendRequest(city: arrayCity[indexPath.row]) { [weak self] weatherSource in
            if let tempC = weatherSource?.current?.temp_c {
                DispatchQueue.main.async {
                    cell.tempCity.text = "\(tempC)°C"
                    cell.contidionLabel.text = "\(weatherSource?.current?.condition?.text ?? "")"
                }
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return }
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        vc.city = arrayCity[indexPath.row]
        WeatherApiManager.shared.sendRequest(city: arrayCity[indexPath.row]) { [weak self] weatherSource in
            if let tempC = weatherSource?.current?.temp_c {
                DispatchQueue.main.async {
                    vc.imageView.sd_setImage(with: URL(string: "https:" + (weatherSource?.current?.condition?.icon ?? "")), completed: nil)
                    vc.cityName.text = "\(weatherSource?.location?.name ?? " ")"
                    vc.pressureLabel.text = "Давление: \(weatherSource?.current?.pressure_mb ?? 0.0) мм/рт"
                    vc.windSpeed.text = "Скорость ветра: \(weatherSource?.current?.wind_kph ?? 0.0) км/ч"
                    vc.localTimeLabe.text = "Местное время: \(weatherSource?.location?.localtime ?? "")"
                    vc.feelsLikeLabel.text = "Ощущается как: \(Int(weatherSource?.current?.feelslike_c ?? 0.0))"
                }
            }
        }
    }
    
    
}

