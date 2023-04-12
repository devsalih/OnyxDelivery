//
//  LoginView.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    @State private var userID: String = ""
    @State private var password: String = ""
    @State private var error: String = ""
    
    var body: some View {
        ZStack {
            topView
            image
            loginForm
        }.fullScreenCover(isPresented: viewModel.showHome) {
            HomeView()
                .environmentObject(viewModel)
        }
    }
    
    var loginForm: some View {
        VStack {
            Text("Welcome Back!")
                .font(.montserrat(.semiBold, 29))
                .foregroundColor(Color("004F62"))
            
            Text("Log back into your account")
                .font(.montserrat(.medium, 12))
                .foregroundColor(Color("004F62"))
                .padding(.bottom, 44)
            
            TextField("User ID", text: $userID)
                .font(.montserrat(.regular, 14))
                .rounded()
            
            SecureField("Password", text: $password)
                .font(.montserrat(.regular, 14))
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
                .font(.montserrat(.medium, 14))
        }
    }
    
    var topView: some View {
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
    }
    
    var image: some View {
        Image("delivery").frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    func login() {
        viewModel.login(userID: userID, password: password) { error in
            self.error = error
        }
        userID = ""
        password = ""
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
