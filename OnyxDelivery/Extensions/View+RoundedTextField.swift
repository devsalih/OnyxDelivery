//
//  View+RoundedTextField.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import SwiftUI

struct RoundedTextField: TextFieldStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding()
            .padding(.horizontal)
            .foregroundColor(foregroundColor)
            .background { Capsule().fill(backgroundColor) }
            .padding(.horizontal)
    }
}

extension View {
    func rounded(backgroundColor: Color = Color("F1F5FB"), foregroundColor: Color = Color("004F62")) -> some View {
        textFieldStyle(RoundedTextField(backgroundColor: backgroundColor, foregroundColor: foregroundColor))
    }
}
