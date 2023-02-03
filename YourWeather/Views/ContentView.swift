//
//  ContentView.swift
//  YourWeather
//
//  Created by duongnh on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationStack(){
            VStack(spacing: 20) {
                HStack {
                    
                    TextField("Enter city name", text: $viewModel.city)
                        .padding()
                        .background(Color(.lightGray))
                        .cornerRadius(5)
                }.padding(.horizontal, 20)
                Button(action: {
                    self.viewModel.searchWeather()
                }) {
                    HStack {
                        
                        
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        Text("Search")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                if viewModel.loading {
                    ProgressView()
                } else if viewModel.errorMessage != "" {
                    Text(viewModel.errorMessage)
                        .font(.body)
                    .foregroundColor(.red)}
                else if viewModel.weatherData != nil {
                    Text("Temperature: \(viewModel.weatherData!.main.temp)°C")
                    Text("Feels like: \(viewModel.weatherData!.main.feelsLike)°C")
                    Text("Min temperature: \(viewModel.weatherData!.main.tempMin)°C")
                    Text("Max temperature: \(viewModel.weatherData!.main.tempMax)°C")
                    Text("Weather: \(viewModel.weatherData!.weather[0].description)")
                }
            }.padding()
                .navigationTitle("\(viewModel.weatherData != nil ? viewModel.weatherData!.name :"")")
                
                    .fontWeight(.bold).navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
