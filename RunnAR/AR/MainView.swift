//
//  ContentView.swift
//  ARRunnAR
//
//  Created by Jaymin Ding on 8/9/22.
//

import SwiftUI
import RealityKit

struct MainView : View {
    @EnvironmentObject var data: DataModel
    @State var swipeDir: String = ""
    var body: some View {
        HStack() {
            ARUIView()
            if data.enableAR {ARDisplayViewTest()}
            else {Spacer()}
        }.gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
            .onEnded { value in
                let horizontalAmount = value.translation.width as CGFloat
                let verticalAmount = value.translation.height as CGFloat
                
                if abs(horizontalAmount) > abs(verticalAmount) {
                    self.swipeDir = horizontalAmount < 0 ? "left" : "right"
                } else {
                    self.swipeDir = verticalAmount < 0 ? "up" : "down"
                }
                print(swipeDir)
                self.swipeDir = ""
            })
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(DataModel.shared)
    }
}
#endif
