//
//  HourlyRowView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct HourlyRowView: View {
    var body: some View {
        let weathers = ["sun.max.fill", "cloud.rain.fill", "cloud.fill", "wind", "cloud.sun.fill"]
            VStack {
                HStack {
                    Image(systemName: "clock")
                    Text("HOURLY FORECAST")
                    Spacer()
                }
                .foregroundColor(.white)
                .bold()
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0 ..< 24) {i in
                            let time = i == 0 ? "Now" : formatTime(hour: i)
                            let weather = weathers.randomElement() ?? "sun.max.fill"
                            let temp = Int.random(in: 50...60)        
                            HourlyForecastView(time: time, weather: weather, temp: temp)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .frame(width: 375, height: 150)
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(red: 0.3, green: 0.55, blue: 0.85).opacity(0.5), location: 0.0),
                        .init(color: Color(red: 0.4, green: 0.65, blue: 0.9).opacity(0.5), location: 0.5),
                        .init(color: Color(red: 0.3, green: 0.55, blue: 0.95).opacity(0.5), location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    func formatTime(hour: Int) -> String {
        return hour < 10 ? "0\(hour)" : "\(hour)"
    }
}

#Preview {
    HourlyRowView()
}
