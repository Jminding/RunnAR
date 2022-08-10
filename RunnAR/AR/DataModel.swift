//
//  DataModel.swift
//  ARRunnAR
//
//  Created by Jaymin Ding on 8/9/22.
//

import Foundation
import Combine
import RealityKit

final class DataModel: ObservableObject {
    static var shared = DataModel()
    @Published var arView: ARView!
    @Published var enableAR = false
    @Published var xTranslation: Float = 0 {
        didSet {translateBox()}
    }
    @Published var yTranslation: Float = 0 {
        didSet {translateBox()}
    }
    @Published var zTranslation: Float = 0 {
        didSet {translateBox()}
    }
    
    init() {
        // ARView Initialization
        arView = ARView(frame: .zero)
        // Load model
        let anchor = try! Experience.loadPerson()
        // Add box anchor to scene
        arView.scene.anchors.append(anchor)
    }
    func translateBox() {
        // Try to the find the model entity
        if let entity = (arView.scene.anchors[0] as? Experience.Person)?.person {
            // Convert cm to m
            let xTranslationM = xTranslation / 100
            let yTranslationM = yTranslation / 100
            let zTranslationM = zTranslation / 100
            // Convert to a vector of 3 floats
            let translation = SIMD3<Float>(xTranslationM, yTranslationM, zTranslationM)
            // Translate the box by this amount
            entity.transform.translation = translation
        }
    }
}
