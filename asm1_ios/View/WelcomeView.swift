//
//  WelcomeView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 01/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
            ZStack {
                Image("background-img")
                    HStack{
                    Image(systemName: "info.circle.fill")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    }.frame(width: UIScreen.main.bounds.width-70, height:UIScreen.main.bounds.height-80,alignment: .topTrailing)
                Image("rmit-logo-black")
                    .frame(width: UIScreen.main.bounds.width-65, height:UIScreen.main.bounds.height-250,alignment: .topLeading)
                    VStack {
                        
                        Text("Da Lat Wonders").font(.largeTitle).italic()
                        Image(systemName: "mountain.2.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(Color("background"))
                            .clipShape(Circle())
                            .frame(width: 110, height: 110, alignment: .center)
                            .background(Color.white)
                            .clipShape(Circle())
                        .shadow(color: Color.blue, radius: 6)
                        Text("It's traveling time!")
                        
                        
                    }
                    
                
            }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
