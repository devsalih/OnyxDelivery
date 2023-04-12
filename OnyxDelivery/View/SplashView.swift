//
//  SplashView.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

struct SplashView: View {
    @State var done: Bool = false
    var body: some View {
        ZStack {
            if done {
                LoginView().transition(.scale.combined(with: .opacity))
            } else {
                ZStack {
                    Image("courier")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    Image("logo")
                }
                .background(Color("#E9FAFF"))
                .zIndex(1)
                .transition(.scale(scale: 2).combined(with: .opacity))
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.done = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


