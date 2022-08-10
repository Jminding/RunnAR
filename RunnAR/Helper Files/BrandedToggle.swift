//
//  BrandedToggle.swift
//  RunnAR
//
//  Created by Jaymin Ding on 8/9/22.
//

import SwiftUI

struct BrandedToggle: View {
    
    @State var isToggled: Bool
    
    var body: some View {
        
        ZStack {
            
            // Toggle background
            RoundedRectangle(cornerRadius: 15)
                .fill(isToggled ? Helpers.primaryColor : Helpers.secondaryColor)
                .frame(width: 46, height: 24)

            // Toggle slider
            withAnimation(.linear(duration: 0.1)) {
                Circle()
                    .fill(isToggled ? Helpers.white : Helpers.primaryColor)
                    .shadow(color: Color(#colorLiteral(red: 0.1176470588, green: 0.1921568627, blue: 0.337254902, alpha: 0.17)), radius: 5, x: 2, y: 2)
                    .frame(width: 16)
                    .offset(x: isToggled ? 12: -12)
            }
        }
        .frame(width: 50, height: 30)
        .onTapGesture {
            isToggled.toggle()
        }
        
    }
}

struct BrandedToggle_Previews: PreviewProvider {
    @State static var toggled = false
    static var previews: some View {
        BrandedToggle(isToggled: toggled)
    }
}
