//
//  customBackgroundView.swift
//  Hike
//
//  Created by Wajd on 12/08/2025.
//

import SwiftUI

struct customBackgroundView: View {
    var body: some View {
        ZStack {
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            Color.customGreenLight
                .cornerRadius(40)
                .opacity(0.85)
                .offset(y: 3)
            
            LinearGradient(colors: [Color.customGreenLight, Color.customGreenMedium], startPoint: UnitPoint.top, endPoint: .bottom)
                .cornerRadius(40)
        }
      //  .padding()
    }
}

#Preview {
    customBackgroundView()
}
