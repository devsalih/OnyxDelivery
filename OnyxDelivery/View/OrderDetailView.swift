//
//  OrderDetailView.swift
//  OnyxDelivery
//
//  Created by devsalih on 11.04.2023.
//

import SwiftUI

struct OrderDetailView: View {
    @Environment(\.dismiss) var dismiss
    let viewModel: ViewModel
    let order: Order
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Order Serial:")
                        .bold()
                        .padding(.bottom, 4)
                    Text("\(order.serial)")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(order.date) \(Image(systemName: "calendar"))")
                        .padding(.bottom, 4)
                    Text("\(order.time) \(Image(systemName: "clock"))")
                }
            }
            .padding()
            .background(.regularMaterial)
            
            Text("\(order.status) Order")
                .bold()
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color(order.color))
            
            ( Text("Name: ").bold() + Text(order.name) +
              Text("\nMobile: ").bold() + Text(order.mobileNo) )
            .lineSpacing(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Address")
                    Text("Apartment")
                    Text("Build")
                    Text("Floor")
                    Text("RegionName")
                }.bold()
                
                VStack(alignment: .leading) {
                    Text(": \(order.address)")
                    Text(": \(order.apartment)")
                    Text(": \(order.build)")
                    Text(": \(order.floor)")
                    Text(": \(order.regionName)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 8)
            
            Spacer()
            
            if order.statusFlag == "0" {
                Button("Deliver", action: deliver).rounded()
            }
            
            VStack(spacing: 0) {
                Divider()
                HStack {
                    (Text("Delivery\n").bold() + Text(order.deliveryAmountString) )
                        .frame(maxWidth: .infinity)
                    Divider()
                    (Text("Bill Amount\n").bold() + Text(order.amountString) )
                        .frame(maxWidth: .infinity)
                    Divider()
                    (Text("Tax\n").bold() + Text(order.taxAmountString) )
                        .frame(maxWidth: .infinity)
                }
                .multilineTextAlignment(.center)
                .frame(height: 60)
                .background(.regularMaterial)
                Divider()
                
                Text("Total: \(order.totalPrice)").bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.regularMaterial)
            }
        }
        .font(.montserrat(size: 16))
        .navigationTitle("Order Detail")
    }
    
    func deliver() {
        dismiss()
        viewModel.deliver(order: order)
    }
}
