//
//  TemperatureConverterApp.swift
//  Shared
//
//  Created by Hamza Oban on 24.03.2022.
//

import SwiftUI

@main
struct TemperatureConverterApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        HStack{
                            Image(systemName: "thermometer")
                            
                            Text("TAB_CONVERSION")
                        }
                    }
                MapView()
                    .tabItem{
                        HStack{
                            Image(systemName: "map")
                            Text("TAB_MAP")
                        }
                }
            }
            .accentColor(.purple)
        }
    }
}
