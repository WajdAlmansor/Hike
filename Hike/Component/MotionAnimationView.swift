//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Wajd on 13/08/2025.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimateBubbels: Bool = false
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> CGFloat {
        return CGFloat(Double.random(in: 0.05...1.0))
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate() ,
                              y: randomCoordinate())
                    .scaleEffect(isAnimateBubbels ? randomScale() : 1)
                
                    .onAppear(){
                        withAnimation(.interpolatingSpring(stiffness:0.25 ,damping: 0.25) .repeatForever().speed(randomSpeed()).delay(randomDelay())){
                            isAnimateBubbels = true
                        }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack{
        MotionAnimationView()
            .background( Circle()
                .fill(.teal))
    }
}
