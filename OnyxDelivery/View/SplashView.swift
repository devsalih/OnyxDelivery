//
//  SplashView.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("courier")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .bottom)
            Image("logo")
        }.background(Color("#E9FAFF"))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


