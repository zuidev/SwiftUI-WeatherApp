//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Di kư tô on 14/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text ("Osaka, Japan")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    
                    Text ("76°")
                        .font(.system(size: 60, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                
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
                    
                } label: {
                    Text("Change Day Time")
                        .frame(width: 250, height: 50, alignment: .center)
                        .font(.system(size: 20, weight: .bold))
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
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
