//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        let fadeStart: CGFloat = 0
                        let fadeEnd: CGFloat = 200
                        let scaleStart: CGFloat = 0
                        let hueStart: CGFloat = 0
                        let hueEnd: CGFloat = fullView.size.height
                        let scaleEnd: CGFloat = fullView.size.height
                        let opacity = minY <= fadeStart ? 0 : minY >= fadeEnd ? 1 : Double(minY - fadeStart) / (fadeEnd - fadeStart)
                        let relativePosition = (minY - scaleStart) / (scaleEnd - scaleStart)
                        let clampedPosition = max(0, min(1, relativePosition))
                        let scale = 0.5 + clampedPosition * 0.5
                        let hue = (clampedPosition * 5).truncatingRemainder(dividingBy: 1)
                        
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: hue, saturation: 1.0, brightness: 1.0))
                            .opacity(opacity)
                            .scaleEffect(scale)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
