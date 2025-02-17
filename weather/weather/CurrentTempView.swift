//
//  CurrentTempView.swift
//  weather
//
//  Created by Jason Yi on 2/16/25.
//

import SwiftUI

struct CurrentTempView: View {
    var city: String
    var temp: Int
    var weatherText: String
    var high: Int
    var low: Int
    
    var body: some View {
        VStack (spacing: 4){
            Text(city)
                .font(.system(size: 40))
            Text("\(temp)°")
                .font(.system(size: 110, weight: .thin))
            Text(weatherText)
                .font(.title)
                .opacity(0.8)
            HStack {
                Text("H:\(high)°")
                Text("L:\(low)°")
            }
            .font(.title)
        }
        .foregroundStyle(.white)
        .padding(.bottom, 20)
        .frame(alignment: .center)
    }
}

#Preview {
    CurrentTempView(city: "Chapel Hill", temp: 55, weatherText: "Sunny", high: 45, low: 57)
}
