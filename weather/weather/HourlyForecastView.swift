//
//  HourlyForecastView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct HourlyForecastView: View {
    var time: String
    var weather: String
    var temp: Int
    
    var body: some View {
        VStack (spacing: 7){
            Text(time)
                .bold()
                .frame(height: 20)
            Image(systemName: weather)
                .symbolRenderingMode(.palette)
                .foregroundStyle(weatherColor1, weatherColor2)
                .frame(width: 30, height: 30)
            Text("\(temp)°")
                .bold()
                .frame(height: 20)
        }
        .frame(width: 40)
        .foregroundStyle(.white)
    }
    
    // Custom color mappings
    var weatherColor1: Color {
        switch weather {
        case "sun.max.fill": return .yellow
        default: return .white
        }
    }
    
    var weatherColor2: Color {
        switch weather {
        case "cloud.sun.fill": return .yellow
        case "cloud.rain.fill": return .blue
        default: return weatherColor1
        }
    }
    
}

#Preview {
    HourlyForecastView(time: "Now", weather: "sun.max.fill", temp: 69)
}
