//
//  OrderRow.swift
//  OnyxDelivery
//
//  Created by devsalih on 11.04.2023.
//

import SwiftUI

struct OrderRow: View {
    let order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("#\(order.serial)")
                    .foregroundColor(Color("808080"))
                    .font(.montserrat(.medium, 12))
                    .padding(.leading)
                
                HStack {
                    column(label: "Status", value: order.status, color: Color(order.color))
                    Divider()
                    column(label: "Total price", value: order.totalPrice)
                    Divider()
                    column(label: "Date", value: order.date)
                }
            }.padding(.vertical)
            
            Color(order.color)
                .frame(width: 44)
                .overlay {
                    Text("Order\nDetails\n\(Image(systemName: "chevron.right"))")
                        .font(.montserrat(.regular, 10))
                        .lineSpacing(5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .cornerRadius(8, corners: [.topRight, .bottomRight])
        }
        .background {
            Color.white
                .cornerRadius(8)
                .shadow(radius: 4, x: 2, y: 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    func column(label: String, value: String, color: Color = Color("004F62")) -> some View {
        VStack {
            Text(label)
                .foregroundColor(Color("808080"))
                .font(.montserrat(.medium, 10))
                .padding(.bottom, 4)
            Text(value)
                .foregroundColor(color)
                .font(.montserrat(.semiBold, 16))
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }
}
