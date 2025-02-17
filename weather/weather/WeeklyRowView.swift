//
//  WeeklyRowView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct WeeklyRowView: View {
    var body: some View {
        let days = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let weathers = ["sun.max.fill", "cloud.rain.fill", "cloud.fill", "wind", "cloud.sun.fill"]
        
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text("10-DAY FORECAST")
                Spacer()
            }
            .foregroundStyle(.white)
            .bold()
            .padding(.top)
            .padding(.horizontal)
            
                
            ScrollView(.vertical) {
                WeeklyForecastView(day: "Today", weather: weathers.randomElement() ?? "sun.max.fill",
                                   low: Int.random(in: 25...45),
                                   high: Int.random(in: 46...70))
                
                ForEach(0 ..< 9) { i in
                    WeeklyForecastView(day: days[(i % 7)],
                                       weather: weathers.randomElement() ?? "sun.max.fill",
                                       low: Int.random(in: 25...45),
                                       high: Int.random(in: 46...70))
                }
            }
            .padding(.horizontal)
        }
        .frame(width: 375, height: 375)
        .background(
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(red: 0.3, green: 0.55, blue: 0.85).opacity(0.5), location: 0.0),
                    .init(color: Color(red: 0.4, green: 0.65, blue: 0.9).opacity(0.5), location: 0.5),
                    .init(color: Color(red: 0.6, green: 0.8, blue: 0.95).opacity(0.5), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    WeeklyRowView()
}
