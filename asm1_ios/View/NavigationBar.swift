//
//  NavigationBar.swift
//  asm1_ios
//
//  Created by An Vu Gia on 31/07/2023.
//

import SwiftUI

struct NavigationBar: View {
    var locations : [locationItem]
    var body: some View {
        NavigationStack{
            HStack(spacing:0){
                NavigationLink(destination: NavigationView(locations: locations), label: {
                    Image(systemName: "list.dash")
                        .frame(width: UIScreen.main.bounds.width/2, height: 25, alignment: .center)
                        .background()
                        .shadow(radius: 5)
                                        })
                NavigationLink(destination: FindView(locations: locations), label: {
                    Image(systemName:"doc.text.magnifyingglass")
                        .frame(width: UIScreen.main.bounds.width/2, height: 25, alignment: .center)
                        .background()
                        .shadow(radius: 5)
                        
                })
              
            }.background(Color.white)
        }
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(locations: locations)
    }
}
