//
//  ContentView.swift
//  weather
//
//  Created by Jason Yi on 2/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(red: 0.3, green: 0.55, blue: 1), location: 0.0),
                    .init(color: Color(red: 0.4, green: 0.65, blue: 0.9), location: 0.5),
                    .init(color: Color(red: 0.6, green: 0.8, blue: 0.95), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            ScrollView(.vertical) {
                CurrentTempView(city: "Chapel Hill", temp: 55, weatherText: "Sunny", high: 57, low: 45)
                HourlyRowView()
                WeeklyRowView()
            }
        }
    }
}

#Preview {
    ContentView()
}
