//
//  WeatherButton.swift
//  SwiftUIDemo
//
//  Created by Arjav Lad on 30/07/22.
//

import SwiftUI

struct WeatherButton: View {
	var title: String
	var textColor: Color
	var backgroundColor: Color
	
	var body: some View {
		Text(title)
			.frame(width: 280, height: 50)
			.background(backgroundColor)
			.foregroundColor(textColor)
			.font(.system(size: 20, weight: .bold, design: .default))
			.cornerRadius(10.0)
	}
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
		WeatherButton(title: "Button", textColor: .white, backgroundColor: .blue)
			.previewLayout(.fixed(width: 300.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
