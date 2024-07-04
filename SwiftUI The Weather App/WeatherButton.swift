//
//  WeatherButton.swift
//  SwiftUI The Weather App
//
//  Created by Macbook Air 2017 on 3. 7. 2024..
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(
                width: 280,
                height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(
                size: 20,
                weight: .medium,
                design: .default))
            .cornerRadius(10)
    }
}
