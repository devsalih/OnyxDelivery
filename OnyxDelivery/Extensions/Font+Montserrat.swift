//
//  Font+Montserrat.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import SwiftUI

extension Font {
    static func montserrat(_ type: FontType = .regular, _ size: CGFloat = 18) -> Font {
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
