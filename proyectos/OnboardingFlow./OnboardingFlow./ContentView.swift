//
//  ContentView.swift
//  OnboardingFlow.
//
//  Created by Esteban Perez Castillejo on 17/4/24.
//

import SwiftUI


let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
  
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
