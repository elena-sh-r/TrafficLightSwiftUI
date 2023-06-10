//
//  LightView.swift
//  TrafficLightSwiftUI
//
//  Created by Elena Sharipova on 10.06.2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let lightStyle: LightStyle
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(lightStyle.opacity)
            .frame(width: 125, height: 125)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: lightStyle.shadowRadius)
            .padding()
    }
}
