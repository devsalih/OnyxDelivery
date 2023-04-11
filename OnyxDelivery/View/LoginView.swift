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
    @State private var error: String = ""
    
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
                    .font(.montserrat(.semiBold, size: 29))
                    .foregroundColor(Color("004F62"))
                
                Text("Log back into your account")
                    .font(.montserrat(.medium, size: 12))
                    .foregroundColor(Color("004F62"))
                    .padding(.bottom, 44)
                
                TextField("User ID", text: $userID)
                    .font(.montserrat(.regular, size: 14))
                    .rounded()
                
                SecureField("Password", text: $password)
                    .font(.montserrat(.regular, size: 14))
                    .rounded()
                    .padding(.bottom, 44)
                
                if !error.isEmpty {
                    Text(error)
                        .padding()
                        .foregroundColor(.red)
                        .padding(.top, -44)
                }
                
                Button("Login", action: login)
                    .rounded()
                    .font(.montserrat(.medium, size: 14))
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
