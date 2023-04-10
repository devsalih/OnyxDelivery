//
//  LoginView.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var userID: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
                    .padding(25)
                
                Spacer()
                
                Image("circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .ignoresSafeArea()
                    .overlay(alignment: .topTrailing) {
                        Image("language").padding(16)
                    }
            }.frame(maxHeight: .infinity, alignment: .top)
            
            Image("delivery")
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                Text("Welcome Back!")
                    .foregroundColor(Color("004F62"))
                
                Text("Log back into your account")
                    .foregroundColor(Color("004F62"))
                    .padding(.bottom, 44)
                
                TextField("User ID", text: $userID)
                    .rounded()
                
                SecureField("Password", text: $password)
                    .rounded()
                    .padding(.bottom, 44)
                
                Button("Login", action: login)
                    .rounded()
            }
        }
    }
    
    func login() { print("username: \(userID), password: \(password)") }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
