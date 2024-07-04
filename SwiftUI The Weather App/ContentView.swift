//
//  ContentView.swift
//  SwiftUI The Weather App
//
//  Created by Macbook Air 2017 on 2. 7. 2024..
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    var weatherStates = [
        WeatherState(dayOfWeek: "MON", imageName: "cloud.sun.fill", degrees: 76),
        WeatherState(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", degrees: 70),
        WeatherState(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", degrees: 64),
        WeatherState(dayOfWeek: "THU",
                     imageName: "cloud.bolt.rain.fill",
                     degrees: 50),
        WeatherState(dayOfWeek: "FRI",
                     imageName: "cloud.heavyrain.fill",
                     degrees: 53)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 76)
                .padding(.bottom, 80)
                
                HStack(spacing: 20) {
                    WeatherDayView(weatherState: weatherStates[0])
                    WeatherDayView(weatherState: weatherStates[1])
                    WeatherDayView(weatherState: weatherStates[2])
                    WeatherDayView(weatherState: weatherStates[3])
                    WeatherDayView(weatherState: weatherStates[4])
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var weatherState: WeatherState
    
    var body: some View {
        VStack {
            Text(weatherState.dayOfWeek)
                .font(.system(
                    size: 16,
                    weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherState.imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(
                    contentMode: .fit)
                .frame(
                    width: 40,
                    height: 40)
            Text("\(weatherState.degrees)°")
                .font(.system(
                    size: 28,
                    weight: .medium,
                    design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
        
        // Simpler gradient
        /*
         ContainerRelativeShape()
             .fill(isNight ? Color.black.gradient : Color.blue.gradient)
             .ignoresSafeArea()
         */
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(
                size: 32,
                weight: .medium,
                design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(
                    contentMode: .fit)
                .frame(
                    width: 180,
                    height: 180)
            Text("\(temperature)°")
                .font(.system(
                    size: 70,
                    weight: .medium,
                    design: .default))
                .foregroundColor(.white)
        }
    }
}
