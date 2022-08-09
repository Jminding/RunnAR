import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()
    
    @Published var currentPage: String = "main" {
        didSet {
            withAnimation(){
                objectWillChange.send(self)
            }
        }
    }
    
}


