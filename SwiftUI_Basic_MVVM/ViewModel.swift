//
//  ViewModel.swift
//  SwiftUI_Basic_MVVM
//
//  Created by Towhid on 5/28/22.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject{
    @Published var title : String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp : String = "-"
    @Published var timezoon : String = "-"
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        
        guard let url = URL (string: "https://api.openweathermap.org/data/2.5/onecall?lat=23.777176&lon=90.399452&exclude=hourly,daily,minutely&units=imperial&appid=9b826c08e0410756f4e0c9a9c1aa4691")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data , error == nil else {
                return
            }
            // convert Data to Model
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = "\(model.current.temp)°"
                    self.timezoon = model.timezone
                    
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}
