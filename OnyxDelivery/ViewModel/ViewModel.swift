//
//  ViewModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    private let service: Service = Service()
    
    @Published var user: User?
    @Published var newOrders: [Order] = []
    @Published var otherOrders: [Order] = []
    @Published var orderDetails: [OrderDetail] = []
    
    var showHome: Binding<Bool> { Binding(get: { self.user != nil }, set: { _ in }) }
    
    func login(userID: String, password: String, error: @escaping (String) -> Void) {
        service.login(userID: userID, password: password, error: error) { user in
            self.user = user
            self.user?.id = userID
            self.fetchOrders()
        }
    }
    
    func logout() { user = nil }
    
    func fetchOrders() {
        if user == nil { return }
        service.getDeliveryBillsItems(userID: user?.id ?? "") { orders in
            DBManager().write(orders: orders)
            self.newOrders = DBManager().getOrders(onlyNews: true)
            self.otherOrders = DBManager().getOrders(onlyNews: false)
        }
    }
    
    func fetchOrderDetails(order: Order) {
        if user == nil { return }
        service.getDeliveryBillsItems(userID: user?.id ?? "", billSerial: order.serial) { orderDetails in
            self.orderDetails = orderDetails
        }
    }
    
    func deliver(_ order: Order) {
        if user == nil { return }
        service.updateDeliveryBillStatus(serial: order.serial, statusFlag: "1") {
            self.fetchOrders()
        }
    }
}
