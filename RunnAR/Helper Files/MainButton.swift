//
//  MainButtons.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/8/22.
//

import SwiftUI

struct MainButton: View {
    
    @EnvironmentObject var viewRouter : ViewRouter
    
    private var text: String = ""
    private var image: String = ""
    init(_ text: String) {
        self.text = text
    }
    init(image: String) {
        self.image = image
    }
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 20)
                .fill(Helpers.primaryColor)
                .frame(width: Helpers.width * 0.5, height: Helpers.height * 0.12)
//                .shadow(color: Color(#colorLiteral(red: 0.2509803922, green: 0.2941176471, blue: 0.462745098, alpha: 0.06)), radius: 30, x: 3, y: 3)
                .shadow(color: Color.gray.opacity(0.7), radius: 8, x: 0, y: 0)
            if (text != "") {
                Text(text)
                    .font(.custom("Inter", size: 50))
                    .foregroundColor(Helpers.white)
            } else if (image != "") {
                if (image == "PlayButton") {
                    Image(image)
                } else {
                    Image(image)
                        .resizable()
                        .frame(width: 55, height: 55)
                }
            }
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(image: "Settings").environmentObject(ViewRouter())
    }
}
