//
//  SettingsView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import UserNotifications

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
//    @EnvironmentObject var SettingsStore: SettingsStoreStore
    @AppStorage("isToggled") var isToggled: Bool = false
    
    var body: some View {
        VStack() {
            HStack() {
                Button(action: {
                    viewRouter.currentPage = "main"
                }) {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Helpers.primaryColor)
                            .frame(width: 30, height: 30)
                            .shadow(color: Color(#colorLiteral(red: 0.2509803922, green: 0.2941176471, blue: 0.462745098, alpha: 0.1)), radius: 11, x: 1, y: 1)
                        Image("BackButton")
                            .resizable()
                            .frame(width: 9, height: 16)
                    }
                }.frame(alignment: .leading).padding()
                Text("Settings")
                    .font(.custom("Inter-Regular", size: 45))
                    .frame(alignment: .center)
                Spacer()
                    .frame(width: Helpers.width * 0.15)
            }
            NavigationView {
                Form {
                    Section(header: Text("Notifications")) {
                        HStack() {
                            Text("Notifications: ")
                            Spacer()
                            ZStack {
                                // Toggle background
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(isToggled ? Helpers.primaryColor : Helpers.secondaryColor)
                                    .frame(width: 46, height: 24)
                                // Toggle slider
                                withAnimation(.linear(duration: 0.1)) {
                                    Circle()
                                        .fill(isToggled ? Helpers.white : Helpers.primaryColor)
                                        .shadow(color: Color(#colorLiteral(red: 0.1176470588, green: 0.1921568627, blue: 0.337254902, alpha: 0.17)), radius: 5, x: 2, y: 2)
                                        .frame(width: 16)
                                        .offset(x: isToggled ? 12: -12)
                                }
                            }
                            .frame(width: 50, height: 30)
                            .onTapGesture(perform: {
                                self.isToggled.toggle()
                                if isToggled {
                                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                                        if success {
                                            print("Notifications Enabled!")
                                        } else if let error = error {
                                            print(error.localizedDescription)
                                        }
                                    }
                                }
                            })
                        }
                    }
                    Section(header: Text("Account")) {
                        if !SettingsStore.isLoggedIn {
                            Button(action: {
                                viewRouter.currentPage = "signup"
                            }) {
                                Text("Sign Up")
                                    .foregroundColor(Helpers.primaryColor)
                            }
                            Button(action: {
                                viewRouter.currentPage = "login"
                            }) {
                                Text("Login")
                                    .foregroundColor(Helpers.primaryColor)
                            }
                        } else if SettingsStore.isLoggedIn {
                            Button(action: {
                                self.signOut()
                            }) {
                                Text("Sign Out")
                                    .foregroundColor(Helpers.primaryColor)
                            }.environmentObject(self.userData)
                        }
                    }
                    Section(header: Text("Data")) {
                        Button(action: {
//                            SettingsStore.updateSettings()
                        }) {
                            Text("Save Your Data to Cloud")
                                .foregroundColor(Helpers.primaryColor)
                        }.disabled(true)
                        Button(action: {
//                            SettingsStore.updateSettings()
                        }) {
                            Text("Load Your Data From Cloud")
                                .foregroundColor(Helpers.primaryColor)
                        }.disabled(true)
                    }.opacity(0.3)
                }
            }
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            SettingsStore.isLoggedIn = false
            userData.clearUser()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
