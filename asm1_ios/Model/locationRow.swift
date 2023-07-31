//
//  locationRow.swift
//  asm1_ios
//
//  Created by An Vu Gia on 28/07/2023.
//

import SwiftUI

struct locationRow: View {
    var locationItem : locationItem
    var body: some View {
        VStack {
            Image(locationItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding([ .top],10)
                .shadow(radius: 1)
            Text(locationItem.name)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .padding()
                      
        }.frame(width: 265, height: 320, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(radius: 10)

                      
            
    }
}

struct locationRow_Previews: PreviewProvider {
    static var previews: some View {
        locationRow(locationItem: locations[0])
    }
}
