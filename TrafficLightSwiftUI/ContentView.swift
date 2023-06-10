//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Elena Sharipova on 10.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstTap = true
    @State private var currentLight = CurrentLight.disabled

    private let lightIsOn = LightStyle(opacity: 1, shadowRadius: 10)
    private let lightIsOff = LightStyle(opacity: 0.3, shadowRadius: 0)
    
    var body: some View {
        VStack {
            LightView(color: .red, lightStyle: currentLight == .red ? lightIsOn : lightIsOff)
            LightView(color: .yellow, lightStyle: currentLight == .yellow ? lightIsOn : lightIsOff)
            LightView(color: .green, lightStyle: currentLight == .green ? lightIsOn : lightIsOff)
            
            Spacer()
            
            Button(action: { toggleLight() }) {
                Text(firstTap ? "START" : "NEXT")
                    .font(.title)
                    .padding(.horizontal)
                    
            }
                .padding()
                .frame(width: 150)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
        .padding()
    }
    
    func toggleLight() {
        firstTap = false
        
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green, .disabled:
            currentLight = .red
        }
    }
    
    private enum CurrentLight {
        case red
        case yellow
        case green
        case disabled
    }
}

struct LightStyle {
    let opacity: Double
    let shadowRadius: CGFloat
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
