//
//  SunView.swift
//  weather
//
//  Created by Jason Yi on 2/17/25.
//

import SwiftUI

struct SunView: View {
    var hour: Int
    var min: Int
    var isSunrise: Bool
    
    
    var body: some View {
        let period = isSunrise ? "AM" : "PM"
        let txt = isSunrise ? "Sunrise" : "Sunset"
        VStack {
            Text("\(hour):\(min)\(period)")
                .bold()
                .frame(height: 20)
            Image(systemName: isSunrise ? "sunrise.fill" : "sunset.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
                .frame(width: 30, height: 30)
            Text(txt)
                .bold()
                .frame(height: 20)
        }
        .frame(width: 65)
        .foregroundStyle(.white)
    
    }
    
}

#Preview {
    SunView(hour: 6, min: 59, isSunrise: false)
}
