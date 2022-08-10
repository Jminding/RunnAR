//
//  ContentView.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @EnvironmentObject var viewRouter : ViewRouter
    
    var body: some View {
        VStack() {
            Text("RunnAR")
                .font(.custom("Inter-SemiBold", size: 80))
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "startGame"
            }) {
                MainButton(image: "PlayButton")
            }
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "howtoplay"
            }) {
                MainButton(image: "QuestionMark")
            }
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "settings"
            }) {
                MainButton(image: "Settings")
            }.disabled(false)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
