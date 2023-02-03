//
//  WeatherAPI.swift
//  YourWeather
//
//  Created by duongnh on 03/02/2023.
//

import Foundation
import os

class WeatherAPI {
    fileprivate let darkSkyApiKey = "af578138a5d3e97d1e1a853ccdb41e7f"
    let logger = Logger()
   
    
    func getWeatherData(city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(self.darkSkyApiKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
           
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                return
            }
            do {
                let data1 = String(data: data, encoding: .utf8) ?? ""
                            
                self.logger.log("The answer is \(data1)")
                
                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
