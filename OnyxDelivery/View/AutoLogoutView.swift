//
//  AutoLogoutView.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import SwiftUI

struct AutoLogoutView<Content: View>: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var onAppear = false
    @State private var lastInteractionDate = Date()
    
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            content
        }
        .onAppear {
            updateLastInteractionDate()
            onAppear = true
        }
        .simultaneousGesture(TapGesture().onEnded { _ in
            updateLastInteractionDate()
        })
        .onReceive(timer) { _ in
            if Date().timeIntervalSince(self.lastInteractionDate) > 120 && onAppear {
                viewModel.logout()
            }
        }
        .onDisappear { onAppear = false }
    }
    
    private func updateLastInteractionDate() {
        self.lastInteractionDate = Date()
    }
}
