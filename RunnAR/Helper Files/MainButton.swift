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
