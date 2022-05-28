//
//  ContentView.swift
//  SwiftUI_Basic_MVVM
//
//  Created by Towhid on 5/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Text(viewModel.timezoon)
                    .font(.system(size: 32))
                Text(viewModel.temp)
                    .font(.system(size: 32))
                Text(viewModel.title)
                    .font(.system(size: 32))
                Text(viewModel.descriptionText)
                    .font(.system(size: 32))
            }.navigationTitle("MVVM Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
