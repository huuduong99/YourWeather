//
//  WeatherViewModel.swift
//  YourWeather
//
//  Created by duongnh on 03/02/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var city = "hanoi"
    @Published var weatherData: WeatherData?
    @Published var loading: Bool = false
    @Published var errorMessage: String = ""
    
    private let weatherAPI = WeatherAPI()
    
    func searchWeather() {
        loading = true
        
        weatherAPI.getWeatherData(city: city) { (result) in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                    self.loading = false
                }
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    self.loading = false
                    self.errorMessage = error.localizedDescription
                }
                print(error)
                break
                
            }
        }
    }
}

