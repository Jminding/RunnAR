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
                    Image("BackButton")
                        .resizable()
                        .frame(width: 9, height: 16)
                }
            }.frame(alignment: .leading).padding()
            List {
                Toggle(isOn: $data.enableAR) {
                    Text("AR")
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
