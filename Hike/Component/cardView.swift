//
//  cardView.swift
//  Hike
//
//  Created by Wajd on 12/08/2025.
//

import SwiftUI

struct cardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }

    
    var body: some View {
        
        ZStack {
            customBackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [Color.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button{
                            //here is what action will gonna happen when press the button
                            
                            print("the button was pressed!")
                            isShowingSheet.toggle()
                        } label: {
                            //here is what the appearance of the button gonna be
                            CustomButtonView()
                                .frame(width: 58, height: 58)
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                            
                            //it show a line that let you know you can drag down the sheet (its for UX)
                                .presentationDragIndicator(.visible)
                            
                                //it show first the smallest size in the array which is medium(half of the screen) and then you can drag it up more for large screen
                                .presentationDetents([.medium,.large])
                                
                        }
                    }
                    
                    Text("Fun & enjoyable outdoor \nactivity for friends and families.")
                       // .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
//                Button{
//                    print("Button is pressed!")
//                }label: {
//                    ZStack {
//                        Rectangle()
//                            .fill(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
//                            .frame(width:200 ,height: 50)
//                            .cornerRadius(30)
//                        
//                        Text("Explore More")
//                            .foregroundStyle(LinearGradient(colors: [Color.customGreenLight, Color.customGreenMedium], startPoint: UnitPoint.top, endPoint: .bottom))
//                            .fontWeight(.black)
//                            .font(.system(size: 20))
//                        
//                        
//                    }
//                        
//                }
                
                
                Button{
                    print("Button is pressed!")
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                    
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1 , y:2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    cardView()
}
