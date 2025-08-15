//
//  SettingsView.swift
//  Hike
//
//  Created by Wajd on 14/08/2025.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcon: [String] = ["AppIcon-Backpack","AppIcon-Camera", "AppIcon-Campfire", "AppIcon-MagnifyingGlass", "AppIcon-Map", "AppIcon-Mushroom" ]
    
    var body: some View {
        
        //The list came with an auto scrolling
        List{
            
            Section {
                
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80 , weight: .black))
                    
                    VStack(spacing : -10) {
                        Text("Hike")
                            .font(.system(size: 66 , weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80 , weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike \nthat you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 15) {
                        ForEach(alternateAppIcon.indices, id: \.self) { item in
                            Button{
                                print("\(alternateAppIcon[item]) was pressed")
                                
                                //UIApplication can have a copy of the whole app
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[item])
                                { error in
                                    if error != nil {
                                        print("Faild request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have chage the app's icon to: \(alternateAppIcon[item])")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)

                
                Text("Choose your favourite app icon from the above")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            .padding(.bottom, 12)
            .listRowSeparator(.hidden)
            
            Section(header: Text("ABOUT THE APP"),
                footer: HStack{
                Spacer()
                Text("CopyRight © All right reserved.")
                Spacer()}
                .padding(.vertical, 8))
            {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
                
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
