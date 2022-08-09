//
//  UserData.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import Foundation
import Firebase
import SwiftUI

class UserData: ObservableObject {
    
    private var userObj: User?
    @Published var uid: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    
    
    func setUser(result: AuthDataResult){
        
        self.userObj = result.user
        self.uid = result.user.uid
        
        let docRef = db.collection("users").document(self.uid)
        
        docRef.getDocument(){ (snapshot, err) in
            if let snapshot = snapshot{
                let data = snapshot.data()
                self.name = data!["name"] as? String ?? "ERROR"
                self.email = data!["email"] as? String ?? "ERROR"
            } else {
                print(err!)
            }
            
            print("Name: \(self.name)")
            print("Email: \(self.email)")
            print("UID: \(self.uid)")
            
            
        }
        
    }
    
}
