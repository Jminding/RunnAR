//
//  ARDisplayView.swift
//  ARRunnAR
//
//  Created by Jaymin Ding on 8/9/22.
//

import SwiftUI
import RealityKit

struct ARDisplayViewTest: View {
    var body: some View {
        return ARViewContainerTest().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainerTest: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        return DataModel.shared.arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ARDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ARDisplayViewTest()
    }
}
