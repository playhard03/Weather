//
//  WeatherApiManager.swift
//  Weather
//
//  Created by Андрей Сергеевич on 08.04.2023.
//

import Foundation
class WeatherApiManager {
    
    static let shared = WeatherApiManager()
    
    func sendRequest(city: String, completion: @escaping (WeatherData?) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=2958f5fc40904e9c805135819230804&q=\(city)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return }
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(weatherData)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
