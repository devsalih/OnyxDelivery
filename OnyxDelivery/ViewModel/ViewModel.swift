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
    
    var showLogin: Binding<Bool> { Binding(get: { self.user == nil }, set: { _ in }) }
    
    func login(userID: String, password: String, error: @escaping (String) -> Void) {
        service.login(userID: userID, password: password, error: error) { self.user = $0 }
    }
    
    func logout() { user = nil }
}
