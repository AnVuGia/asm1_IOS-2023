//
//  WelcomeView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 01/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var isPopUp = false
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background-img")
                HStack{
                    Button{
                        isPopUp.toggle()
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color.white)
                            .font(.title2)
                    }.popover(isPresented: $isPopUp) {
                        VStack {
                            Text("Author: Vu Gia An")
                                .padding()
                            Text("StudentID: s3926888")
                                .padding()
                            Text("Program: SSET")
                                .padding()
                            Button("Close") {
                                isPopUp = false
                            }.padding()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    }
                }.frame(width: UIScreen.main.bounds.width-70, height:UIScreen.main.bounds.height-80,alignment: .topTrailing)
                Image("rmit-logo-black")
                    .frame(width: UIScreen.main.bounds.width-65, height:UIScreen.main.bounds.height-250,alignment: .topLeading)
                VStack {
                    
                    Text("Da Lat Wonders")
                        .font(Font.custom("DancingScript-VariableFont_wght", size: 36, relativeTo: .title))
                        .fontWeight(.bold)
                        .italic()
                    Image(systemName: "mountain.2.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .frame(width: 110, height: 110, alignment: .center)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.blue, radius: 6)
                    Text("It's traveling time!")
                        .font(.title2)
                        .padding()
                    
                }
                
                NavigationLink(destination: MainPageView(locations: locations), label: {
                    Text("Get Started!")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                }).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 300, alignment: .bottom)
            }
            
        }
       
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
