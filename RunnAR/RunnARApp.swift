//
//  RunnARApp.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import FirebaseCore
import CoreData
import Firebase

let db = Firestore.firestore()

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct RunnARApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(ViewRouter()).environmentObject(UserData())
        }
    }
}
