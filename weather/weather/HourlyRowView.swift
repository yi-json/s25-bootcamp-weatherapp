//
//  HourlyRowView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct HourlyRowView: View {
    var body: some View {
        let dayWeathers = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "wind"]
        let nightWeathers = ["moon.stars.fill", "cloud.moon.fill", "cloud.moon.rain.fill"]
        let sunriseHour = 6
        let sunsetHour = 18
        
        let startHour = Int.random(in: 0...23)
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
                    HStack (spacing: 15){
                        ForEach(0 ..< 24) {i in
                            let x = (startHour + i) % 24
                            let hour = i == 0 ? "Now" : formatTime(hour: x)
                            let isDaytime = x >= sunriseHour && x < sunsetHour
                            let hourInt = getHourInt(from: hour)

                            let weather = isDaytime ? (dayWeathers.randomElement() ?? "sun.max.fill") : (nightWeathers.randomElement() ?? "moon.stars.fill")
                            let temp = Int.random(in: 50...60)

                            HourlyForecastView(time: hour, weather: weather, temp: temp)
                            
                            if isSunriseOrSunset(hour: hour) {
                                let min = Int.random(in: 50...59)
                                SunView(hour: hourInt, min: min, isSunrise  : hour.contains("AM"))
                            }
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
        let period = hour < 12 ? "AM" : "PM"
        let hr = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        return "\(hr)\(period)"
    }
    
    func getHourInt(from hour: String) -> Int {
        return Int(hour.prefix(while: { $0.isNumber })) ?? 0
    }

    func isSunriseOrSunset(hour: String) -> Bool {
        let hourInt = getHourInt(from: hour)
        return (hourInt == 6 && hour.contains("AM")) || (hourInt == 5 && hour.contains("PM"))
    }
}

#Preview {
    HourlyRowView()
}
