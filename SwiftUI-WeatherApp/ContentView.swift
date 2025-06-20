//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Di kư tô on 14/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNightMode = false
    
    var body: some View {
        ZStack {
            BackgroudView(isNightMode: $isNightMode)
            
            VStack {
                CityTextView(cityName: "Osaka, Japan")
                
                MainWeatherStatusView(imageName: isNightMode ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack(spacing: 20) {
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "wind",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "smoke.fill",
                                   temperature: 72)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 80)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.fill",
                                   temperature: 73)
                }
                
                
                Spacer()
                
                Button{
                    isNightMode.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  bgColor: .cyan)
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
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundColor(.pink)
//                .foregroundStyle(.pink, .orange, .blue) //iOS > 15, go with ".palette" mode
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroudView: View {
    
    @Binding var isNightMode: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNightMode ? .black : .blue,
//                                                   isNightMode ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNightMode ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text (cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
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
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            
            Text ("\(temperature)°")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
