//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Di kư tô on 14/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNightMode: Bool = false
    
    var body: some View {
        ZStack {
            BackgroudView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Osaka, Japan")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill",
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
                    print("clicked")
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  bgColor: .white)
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
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroudView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
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
