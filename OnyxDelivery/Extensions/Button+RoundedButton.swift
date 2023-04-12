//
//  Button+RoundedButton.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background {
                Capsule().fill(backgroundColor)
            }
            .padding(.horizontal)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension Button {
    func rounded(backgroundColor: Color = Color("004F62")) -> some View {
        buttonStyle(RoundedButtonStyle(backgroundColor: backgroundColor))
    }
}
