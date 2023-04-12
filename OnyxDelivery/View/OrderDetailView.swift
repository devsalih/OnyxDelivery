//
//  OrderDetailView.swift
//  OnyxDelivery
//
//  Created by devsalih on 11.04.2023.
//

import SwiftUI

struct OrderDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    let order: Order
    
    var body: some View {
        VStack {
            detail
            status
            contact
            address
            billDetail
            
            Spacer()
            
            if order.statusFlag == "0" {
                Button("Deliver") {
                    dismiss()
                    viewModel.deliver(order: order)
                }.rounded()
            }
            
            amount
        }
        .font(.montserrat(.regular, 16))
        .navigationTitle("Order Detail")
        .onAppear { viewModel.fetchOrderDetails(order: order) }
    }
    
    var detail: some View {
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
    }
    
    var status: some View {
        Text("\(order.status) Order")
            .bold()
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color(order.color))
    }
    
    var contact: some View {
        ( Text("Name: ").bold() + Text(order.name) +
          Text("\nMobile: ").bold() + Text(order.mobileNo) )
        .lineSpacing(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    var address: some View {
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
    }
    
    var billDetail: some View {
        VStack {
            HStack {
                Text("Bill Detail").bold()
                Spacer()
                Text("\(viewModel.orderDetails.count) items")
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.orderDetails, id: \.itemCode) { detail in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Item Code")
                                Text("Item Name")
                                Text("Item Price")
                                Text("VAT Percentage")
                                Text("VAT Amount")
                            }
                            VStack(alignment: .leading) {
                                Text(": \(detail.itemCode)")
                                Text(": \(detail.itemName)")
                                Text(": \(detail.itemPrice)")
                                Text(": \(detail.vatPercentage)")
                                Text(": \(detail.vatAmount)")
                            }
                        }
                        .padding()
                        .background(.regularMaterial)
                        .padding(.leading)
                    }
                }.padding(.trailing)
            }
        }
    }
    
    var amount: some View {
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
}
