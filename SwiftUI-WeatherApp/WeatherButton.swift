//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Di kư tô on 15/06/2025.
//

import SwiftUI

struct WeatherButton:View {
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50, alignment: .center)
            .font(.system(size: 20, weight: .bold))
            .background(bgColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
