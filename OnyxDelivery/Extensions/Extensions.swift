//
//  Extensions.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

extension Color {
    init(_ hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

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

extension Font {
    static func montserrat(_ type: FontType = .regular, size: CGFloat = 18) -> Font {
        return Font.custom("Montserrat-\(type.rawValue)", size: size)
    }
}

enum FontType: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case extraLight = "ExtraLight"
    case extraLightItalic = "ExtraLightItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension String {
    var lastWord: String { components(separatedBy: " ").last ?? "" }
    
    var wordsExceptLast: String { components(separatedBy: " ").dropLast().joined(separator: " ") }
}
