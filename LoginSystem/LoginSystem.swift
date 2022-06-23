//
//  LoginSystem.swift
//  MyTrainingApp
//
//  Created by Oğuz Kayra Büyükyıldırım on 22.06.2022.
//

import SwiftUI

struct AppHomePage: View {
    var body: some View {
        Text("WELCOME!")
        .bold()
        .padding()
        .font(.largeTitle)
        .foregroundColor(.green)
    }
}

struct AppLogin : View{
    @State var signInSuccess: Bool = false
    var body: some View{
        if signInSuccess {
            AppHomePage()
        }else{
            LoginSystem(signInSuccess: $signInSuccess)
        }
    }
}

struct LoginSystem: View {
    @State var password: String = ""
    @State var username: String = ""
    @State var warningText: String = ""
    @Binding var signInSuccess: Bool
    var body: some View {
        Color.green.ignoresSafeArea()
            .overlay(VStack{
            Text("Login System")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding()

            TextField("Username" , text:$username)
            .padding()
            .frame(width: 250, height: 35)
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
            .disableAutocorrection(true)
            .autocapitalization(.none)

            SecureField("Password" , text:$password)
            .padding()
            .frame(width: 250, height: 35)
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
            .disableAutocorrection(true)
            .autocapitalization(.none)

            Button("Login"){
                if username == "admin" && password == "pass"{
                    self.signInSuccess = true
                }else{
                    warningText = "Username or password is incorrect!"
                }
            }
            .padding()
            .foregroundColor(.black)
            .frame(width: 250, height: 35)
            .background(Color.white)
            .cornerRadius(10)
            
            Text("\(warningText)")
            .font(.system(size:15))
            .bold()
            .foregroundColor(.red)
        })
    }
}

struct LoginSystem_Previews:
    PreviewProvider {
    static var previews: some View {
        AppLogin()
    }
}
