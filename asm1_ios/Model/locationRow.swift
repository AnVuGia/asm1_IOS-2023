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
        ZStack{
            Image(locationItem.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 150)
                .padding()
            Text(locationItem.name)
                .foregroundColor(.black)
                .padding([ .leading, .trailing],20)
                .padding([.top, .bottom], 5)
                .background(Color.black)
                .cornerRadius(10)
                .opacity(0.8)
                .frame(width: 300, height: 150, alignment: .bottomTrailing)
            Text(locationItem.name)
                .foregroundColor(.black)
                .frame(width: 300, height: 150, alignment: .bottomLeading)
            
            
           
        }.background()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            .padding()
        }
}

struct locationRow_Previews: PreviewProvider {
    static var previews: some View {
        locationRow(locationItem: locations[0])
    }
}
