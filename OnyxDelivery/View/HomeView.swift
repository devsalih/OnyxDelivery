//
//  HomeView.swift
//  OnyxDelivery
//
//  Created by devsalih on 11.04.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var page: Int = 0
    
    var body: some View {
        NavigationView {
            AutoLogoutView {
                VStack(spacing: 20) {
                    appBar
                    segmentedControl
                    orderList
                    Button("Logout", action: viewModel.logout)
                        .rounded(backgroundColor: Color("D42A0F"))
                }
            }.environmentObject(viewModel)
        }
    }
    
    var appBar: some View {
        HStack(alignment: .bottom) {
            if let user = viewModel.user, let name = user.deliveryName {
                Text("\(name.wordsExceptLast)\n\(Text(name.lastWord).bold())")
                    .font(.montserrat(.medium, 25))
                    .foregroundColor(.white)
                    .padding(.leading, 17)
                    .padding(.bottom, 26)
            }
            Spacer()
            Image("deliveryman")
                .background {
                    Image("circle_blue")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                }
        }
        .background {
            Color("D42A0F")
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()
        }
    }
    
    var segmentedControl: some View {
        HStack(spacing: 0) {
            ForEach(0..<2) { i in
                Text(["New", "Others"][i])
                    .font(.montserrat(.semiBold, 14))
                    .foregroundColor(page == i ? .white : Color("#004F62"))
                    .frame(width: 110, height: 36)
                    .onTapGesture { page = i }
            }
        }
        .background {
            ZStack {
                Capsule()
                    .fill(.white)
                    .shadow(radius: 6, y: 5)
                Capsule()
                    .fill(Color("#004F62"))
                    .frame(width: 110)
                    .offset(x: [-55, 55][page])
                    .shadow(radius: 6, x: [5, -5][page], y: 5)
            }
        }
        .animation(.spring(), value: page)
    }
    
    var orderList: some View {
        ScrollView {
            if let filteredOrders = viewModel.orders.filter({ order in
                ["0", "123"][page].contains(order.statusFlag)
            }), !filteredOrders.isEmpty {
                ForEach(filteredOrders, id: \.serial) { order in
                    NavigationLink {
                        OrderDetailView(viewModel: viewModel, order: order)
                    } label: {
                        OrderRow(order: order)
                    }
                }
            } else {
                Text("No orders found.")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
