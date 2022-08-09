//
//  SettingsStore.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Combine
import Firebase
import FirebaseAuth
import Foundation

class SettingsStore: ObservableObject {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    private enum Keys {
        static let loggedIn = "loggedIn"
        static let notificationEnabled = "notifications_enabled"
    }
    private let cancellable: Cancellable
    private let defaults: UserDefaults
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            Keys.loggedIn: false,
            Keys.notificationEnabled: false
        ])
        
        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map { _ in () }
            .subscribe(objectWillChange)
    }
    
    var isLoggedIn: Bool {
        set {
            defaults.set(newValue, forKey: Keys.loggedIn)
        }
        get {
            defaults.bool(forKey: Keys.loggedIn)
        }
    }
    
    var isNotificationEnabled: Bool {
        set {
            defaults.set(newValue, forKey: Keys.notificationEnabled)
        }
        get {
            defaults.bool(forKey: Keys.notificationEnabled)
        }
    }
}

extension SettingsStore {
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.isLoggedIn = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
