//
//  WeeklyForecastView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct WeeklyForecastView: View {
    var day: String
    var weather: String
    var low: Int
    var high: Int
    
    var body: some View {
        HStack {
            Text(day)
                .frame(width: 50, alignment: .leading)
            Image(systemName: weather)
                .foregroundStyle(weatherColor1, weatherColor2)
                .frame(width: 30)
            Text("\(low)°")
                .frame(width: 40, alignment: .trailing)
            TemperatureBar(low: low, high: high)
                .frame(width: 80, height: 6)
            Text("\(high)°")
                .frame(width: 40, alignment: .leading)
        }
        .foregroundStyle(.white)
        .bold()
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

struct TemperatureBar: View {
    var low: Int
    var high: Int
    
    var body: some View {
        GeometryReader { geometry in
            let minTemp: CGFloat = 30
            let maxTemp: CGFloat = 100
            
            let totalRange = maxTemp - minTemp
            let lowPosition = CGFloat(low - Int(minTemp)) / totalRange
            let highPosition = CGFloat(high - Int(minTemp)) / totalRange
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.blue.opacity(0.3))
                    .frame(height: 6)
                Capsule()
                    .fill(Color.blue)
                    .frame(width: (highPosition - lowPosition) * geometry.size.width, height: 6)
                    .offset(x: lowPosition * geometry.size.width)
            }
        }
    }
    
    
}

#Preview {
    WeeklyForecastView(day: "Today", weather: "sun.max.fill", low: 54, high: 70)
}
