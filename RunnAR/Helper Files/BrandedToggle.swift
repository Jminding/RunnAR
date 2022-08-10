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
                    .shadow(color: Color(#colorLiteral(red: 0.2509803922, green: 0.2941176471, blue: 0.462745098, alpha: 0.1)), radius: 11, x: 1, y: 1)
                    .frame(width: 16)
                    .offset(x: isToggled ? 12: -12)
            }
        }
        .frame(width: 50, height: 30)
//        .onTapGesture {
//            isToggled.toggle()
//        }
        
    }
}

struct BrandedToggle_Previews: PreviewProvider {
    @State static var toggled = false
    static var previews: some View {
        BrandedToggle(isToggled: toggled)
    }
}
