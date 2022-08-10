//
//  ARUIView.swift
//  ARRunnAR
//
//  Created by Jaymin Ding on 8/9/22.
//

import SwiftUI

struct ARUIView: View {
    @EnvironmentObject var data: DataModel
    @EnvironmentObject var viewRouter: ViewRouter
    @State var swipeDir = ""
    var body: some View {
        VStack() {
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
            List {
//                Toggle(isOn: $data.enableAR) {
//                    Text("AR")
//                }
                HStack() {
                    Text("AR")
                    Spacer()
                    ZStack {
                        // Toggle background
                        RoundedRectangle(cornerRadius: 15)
                            .fill(data.enableAR ? Helpers.primaryColor : Helpers.secondaryColor)
                            .frame(width: 46, height: 24)
                        // Toggle slider
                        withAnimation(.linear(duration: 0.1)) {
                            Circle()
                                .fill(data.enableAR ? Helpers.white : Helpers.primaryColor)
                                .shadow(color: Color(#colorLiteral(red: 0.1176470588, green: 0.1921568627, blue: 0.337254902, alpha: 0.17)), radius: 5, x: 2, y: 2)
                                .frame(width: 16)
                                .offset(x: data.enableAR ? 12: -12)
                        }
                    }
                    .frame(width: 50, height: 30)
                    .onTapGesture(perform: {
                        data.enableAR.toggle()
                    })
                }
                Stepper("X: \(Int(data.xTranslation))", value: $data.xTranslation, in: -100...100)
                Stepper("Y: \(Int(data.yTranslation))", value: $data.yTranslation, in: -100...100)
                Stepper("Z: \(Int(data.zTranslation))", value: $data.zTranslation, in: -100...100)
            }
        }
    }
}

struct ARUIView_Previews: PreviewProvider {
    static var previews: some View {
        ARUIView()
    }
}
