//
//  SettingsView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var settings: SettingsStore
    
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
                        Toggle(isOn: $settings.isNotificationEnabled) {
                            Text("Notifications: ")
                        }.environmentObject(SettingsStore())
                    }
                    if !settings.isLoggedIn {
                        Button(action: {
                            viewRouter.currentPage = "signup"
                        }) {
                            Text("Sign Up")
                        }
                        Button(action: {
                            viewRouter.currentPage = "login"
                        }) {
                            Text("Login")
                        }
                    } else if settings.isLoggedIn {
                        Button(action: {
                            settings.signOut()
                        }) {
                            Text("Sign Out")
                        }
                    }
                }.environmentObject(SettingsStore())
            }.environmentObject(SettingsStore())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsStore())
    }
}
