//
//  MainPageView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 01/08/2023.
//

import SwiftUI

struct MainPageView: View {
    var locations : [locationItem]
    @State var selectedViewMode : Int = 1
    @State var isDarkMode : Bool = false
    var body: some View {
        ZStack {
            VStack {
                Picker("Rating Filter", selection: $selectedViewMode){
                            Image(systemName: "list.dash")
                                .frame(width: UIScreen.main.bounds.width/2, height: 25, alignment: .center)
                                .background()
                                .shadow(radius: 5)
                                .tag(1)
                        
                            Image(systemName:"doc.text.magnifyingglass")
                                .frame(width: UIScreen.main.bounds.width/2, height: 25, alignment: .center)
                                .background()
                                .shadow(radius: 5)
                                .tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                if(selectedViewMode == 1){
                    DashboardView(locations: locations).preferredColorScheme(isDarkMode ? .dark : .light)
                } else {
                    FindView(locations: locations).preferredColorScheme(isDarkMode ? .dark : .light)
                }
                Spacer()
            }
            Button{
                isDarkMode.toggle()
            }label: {
                Image(systemName: "moon.fill")
                    .foregroundColor(isDarkMode ? Color.black : Color.yellow)
                    .font(.title3)
                    .frame(width: 30, height: 50)
                    .background(isDarkMode ? Color.white : Color.blue)
                    .clipShape(Circle())
                    .shadow(color: isDarkMode ? Color.white : Color.blue, radius: 2)
            }.frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.height-150, alignment: .topTrailing)
        }
            
        
    }}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(locations: locations)
    }
}
