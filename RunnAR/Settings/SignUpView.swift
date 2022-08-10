//
//  SignUpView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmpassword: String = ""
    @State var showLoginView = false
    @State var showText = false
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        ZStack{
            
            Helpers.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                Text("Welcome")
                    .font(
                        .custom("Inter-SemiBold", size: 65.0))
                    .padding(.bottom, -15.0)

                Text("Sign up")
                    .font(
                        .custom("Inter-SemiBold", size: 20.0))
                    .padding(.bottom, 60)
                
                HStack { // Email Field
                    Image("Mail_Black").resizable()
                        .frame(width: 23, height: 18)
                        .padding(.leading)
                    TextField("Email", text: $email)
                        .padding()
                        .font(
                            .custom(email == "" ? "Inter-Regular" : "Inter-Bold", size: 15.0))
                        .frame(width: 275, height: 50)
                        
                }
                    .background(Color.white)
                    .cornerRadius(27)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                
                HStack { // Name Field
                    Image("User_Black").resizable()
                        .frame(width: 23, height: 23)
                        .padding(.leading)
                    TextField("Username", text: $name)
                        .padding()
                        .font(
                            .custom(name == "" ? "Inter-Regular" : "Inter-Bold", size: 15.0))
                        .frame(width: 275, height: 50)
                        
                }
                    .background(Color.white)
                    .cornerRadius(27)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                    .padding()
                
                HStack{ // Psswd Field
                    Image("Lock_Black").resizable()
                        .frame(width: 21, height: 27)
                        .padding(.leading)
                    SecureField("Password", text: $password)
                        .padding()
                        .font(
                            .custom(password == "" ? "Inter-Regular" : "Inter-Bold", size: 15.0))
                        .frame(width: 275, height: 50)
                }
                    .background(Color.white)
                    .cornerRadius(27)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                .padding(.bottom)
                
                HStack{ // Psswd Field
                    Image("Lock_Black").resizable()
                        .frame(width: 21, height: 27)
                        .padding(.leading)
                    SecureField("Confirm your password", text: $confirmpassword)
                        .padding()
                        .font(
                            .custom(confirmpassword == "" ? "Inter-Regular" : "Inter-Bold", size: 15.0))
                        .frame(width: 275, height: 50)
                }
                    .background(Color.white)
                    .cornerRadius(27)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                
                
                Spacer()
                
                HStack{ // Sign in btn
                    
                    Spacer()
                    
                    Text("Create")
                        .font(
                            .custom("Inter-Bold", size: 25.0))
                        .padding(.trailing, 5)
                    
                    Button(action: {
                        Auth.auth().createUser(withEmail: self.email, password: self.password, completion: self.signUp)
                    }) {
            
                        Image("RightArrow_White").resizable()
                            .frame(width: 21.0, height: 15.0)
                    
                    }
                    .frame(width: 70.0, height: 45.0)
                    .background(Helpers.primaryColor)
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .cornerRadius(25)
                    .padding(.trailing, 35)
                    
                
                }
                
                
                
                HStack{
                    
                    Text("Already have an account?")
                        .font(
                            .custom("Inter-Regular", size: 15.0))
                        .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    
                    Button(action: {
                        self.viewRouter.currentPage = "login"
                    }){
                        
                        Text("Sign in")
                            .foregroundColor(Color.black)
                            .font(
                                .custom("Inter-Bold", size: 15.0))
                            .underline()
                    
                    }
                    
                }
                    .padding()
            }
            
        }
        
    }
    
    func signUp(result: AuthDataResult?, error: Error?){
        
        if let error = error {
            
            print(error.localizedDescription)
            
        } else {
            
            if let result = result {
                
                db.collection("users").document(result.user.uid).setData(["uid": result.user.uid, "name": name, "email": email])
                print("Signed up...")
                self.userData.setUser(result: result)
                SettingsStore.isLoggedIn = true
                self.viewRouter.currentPage = "settings"
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
