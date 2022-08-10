//
//  HowToPlay.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI

struct HowToPlay: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
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
                Text("How To Play")
                    .font(.custom("Inter-Regular", size: 45))
                    .frame(alignment: .center)
                Spacer()
                    .frame(width: Helpers.width * 0.1)
            }
            VStack() {
                Text("Four Simple Rules:")
                    .font(.custom("Inter-Regular", size: 23))
                    .multilineTextAlignment(.leading)
                Spacer()
                List {
                    Text("You are the runner, run from the chaser")
                        .font(.custom("Inter-Regular", size: 23))
                        .multilineTextAlignment(.leading)
                    Text("Swipe left or right to switch lanes")
                        .font(.custom("Inter-Regular", size: 23))
                        .multilineTextAlignment(.leading)
                    Text("Swipe up to jump and down to duck")
                        .font(.custom("Inter-Regular", size: 23))
                        .multilineTextAlignment(.leading)
                    Text("Don't get caught")
                        .font(.custom("Inter-SemiBold", size: 23))
                        .multilineTextAlignment(.leading)
                }
            }
            Spacer()
            Text("Good Luck!")
                .font(.custom("Inter-Bold", size: 23))
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
