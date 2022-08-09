//
//  StartGame.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI

struct StartGame: View {
    @EnvironmentObject var viewRouter : ViewRouter
    
    var body: some View {
        VStack() {
            Text("RunnAR")
                .font(.custom("Inter-SemiBold", size: 80))
            Spacer()
//            MainButton(image: "PlayButton", goToPage: "")
//            Spacer()
//            MainButton(image: "QuestionMark", goToPage: "howtoplay")
//            Spacer()
//            MainButton(image: "Settings", goToPage: "")
//            Spacer()
        }
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
    }
}
