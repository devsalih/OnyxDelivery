//
//  String+NumberFormatter.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

extension String {
    func doubleValueWith(decimalCount count: Int) -> String {
        guard let doubleValue = Double(self) else { return self }
        let roundedValue = String(format: "%.\(count)f", doubleValue)
        return roundedValue
    }
}
