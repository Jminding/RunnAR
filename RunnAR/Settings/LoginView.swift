//
//  LoginView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showText = false
    @State var showLoginView: Bool = false
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        
        ZStack(){
              
            Helpers.white // BG color
                  .edgesIgnoringSafeArea(.all)
              
              VStack(){

                  Spacer()
                  
                  // Title text
                  
                  Text("Hello")
                      .font(
                          .custom("Inter-SemiBold", size: 85.0))
                      .padding(.bottom, -15.0)
        
                  Text("Sign in to your account")
                      .font(
                          .custom("Inter-SemiBold", size: 20.0))
                      .padding(.bottom, 60)
                  
                  // Sign in fields
                  

                      
                  HStack() { // Email Field
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
                      .padding()
                          
              
                  
                  HStack(){ // Psswd Field
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
                    
                  
                  
                  
                  
                  Button(action:{ // Forgot psswd btn
                    print("Forgot password btn pressed")
                  }){
                      
                      HStack{
                          
                          Spacer()
                          
                          Text("Forgot your password?")
                              .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                              .padding(.trailing, 45)
                              .padding(.top, 15)
                              .font(
                                  .custom("Inter-Regular", size: 15))
                      }
                      
                  }
                  
                  
                  
                  Spacer()
                  
                  HStack{ // Sign in btn
                      
                      Spacer()
                      
                      Text("Sign in")
                          .font(
                              .custom("Inter-Bold", size: 25.0))
                          .padding(.trailing, 10)
                      
                      Button(action: {
                        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: self.signIn)
                      }){
                          
                          Image("RightArrow_White").resizable()
                              .frame(width: 21.0, height: 15.0)
                              
                      
                      }
                          .frame(width: 70.0, height: 45.0)
                          .background(Helpers.primaryColor)
                          .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                          .cornerRadius(25)
                          .padding(.trailing, 35)
                  
                      
                  }
                  .padding(.top, 50)
                 
                  Spacer()
                  
                  HStack{ // Create account btn
                      
                      Text("Don't have an account?")
                          .font(
                              .custom("Inter-Regular", size: 15.0))
                          .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                      
                        Button(action: {
                            self.viewRouter.currentPage = "signup"
                        }){
                          
                            Text("Create")
                              .foregroundColor(Color.black)
                              .font(
                                  .custom("Inter-Bold", size: 15.0))
                              .underline()
                          
                      }
                      .padding(.leading, -2)
                      
                  }
                      .padding()
                  
              }
          
          }
        
                    
    }
    
    func signIn(result: AuthDataResult?, error: Error?){
        
        if let error = error {
            
            print(error.localizedDescription)
            
        } else {
            
            print("Signed in...")
            
            if let result = result {
                self.userData.setUser(result: result)
                SettingsStore.isLoggedIn = true
                self.viewRouter.currentPage = "settings"
                
            }

        }

    }

}
    




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(ViewRouter())
    }
}
