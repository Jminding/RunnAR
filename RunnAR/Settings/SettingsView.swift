//
//  SettingsView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
//    @EnvironmentObject var SettingsStore: SettingsStoreStore
    
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
                            BrandedToggle(isToggled: SettingsStore.notificationsEnabled)
//                                .onTapGesture(perform: {
//                                    SettingsStore.notificationsEnabled.toggle()
//                                })
                            // TODO: FIX NOTIFS TURNING OFF AND ON BY ITSELF
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
