//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Arjav Lad on 30/07/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight: Bool = false
	
	var body: some View {
		ZStack {
			BackgroundView(isNight: $isNight)
			VStack {
				CityTextView(cityName: "Surat")
				MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
									  temp: 31)
				
				HStack(spacing: 20) {
					WeatherDayView(dayOfTheWeek: "SUN",
								   imageName: "cloud.sun.fill",
								   temp: 32)
					WeatherDayView(dayOfTheWeek: "MON",
								   imageName: "cloud.sun.fill",
								   temp: 30)
					WeatherDayView(dayOfTheWeek: "TUE",
								   imageName: "cloud.sun.fill",
								   temp: 29)
					WeatherDayView(dayOfTheWeek: "WED",
								   imageName: "sun.max.fill",
								   temp: 33)
					WeatherDayView(dayOfTheWeek: "THU",
								   imageName: "sun.max.fill",
								   temp: 35)
				}
				Spacer()
				
				Button {
					self.isNight.toggle()
				} label: {
					WeatherButton(title: "Change Day Time",
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
	var dayOfTheWeek: String
	var imageName: String
	var temp: Int
	
	var body: some View {
		VStack {
			Text(dayOfTheWeek)
				.font(.system(size: 16, weight: .medium))
				.foregroundColor(.white)
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 40, height: 40)
			Text("\(temp)°")
				.font(.system(size: 28, weight: .medium))
				.foregroundColor(.white)
		}
	}
}

struct BackgroundView: View {
	@Binding var isNight: Bool
	
	var body: some View {
		LinearGradient(gradient: .init(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
					   startPoint: .topLeading,
					   endPoint: .bottomLeading)
		.edgesIgnoringSafeArea(.all)
	}
}

struct CityTextView: View {
	var cityName: String
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundColor(.white)
			.padding()
	}
}

struct MainWeatherStatusView: View {
	var imageName: String
	var temp: Int
	var body: some View {
		VStack(spacing: 10) {
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180)
			Text("\(temp)°")
				.font(.system(size: 70, weight: .medium))
				.foregroundColor(.white)
		}
		.padding(.bottom, 40)
	}
}

