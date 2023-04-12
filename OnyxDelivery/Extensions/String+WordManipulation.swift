//
//  String+WordManipulation.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import SwiftUI

extension String {
    var lastWord: String { components(separatedBy: " ").last ?? "" }
    var wordsExceptLast: String { components(separatedBy: " ").dropLast().joined(separator: " ") }
}
