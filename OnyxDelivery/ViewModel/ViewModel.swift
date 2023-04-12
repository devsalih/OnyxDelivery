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
    @Published var orders: [Order] = []
    
    var showHome: Binding<Bool> { Binding(get: { self.user != nil }, set: { _ in }) }
    
    func login(userID: String, password: String, error: @escaping (String) -> Void) {
        service.login(userID: userID, password: password, error: error) { user in
            self.user = user
            self.user?.id = userID
            self.loadOrders()
        }
    }
    
    func loadOrders() {
        if user == nil { return }
        service.getDeliveryBillsItems(userID: user?.id ?? "") { orders in
            self.orders = orders
        }
    }
    
    func deliver(order: Order) {
        if user == nil { return }
        service.updateDeliveryBillStatus(serial: order.serial, statusFlag: "1") {
            self.loadOrders()
        }
    }
    
    func logout() { user = nil }
}
